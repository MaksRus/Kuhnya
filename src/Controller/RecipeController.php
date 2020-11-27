<?php

namespace App\Controller;

use App\Entity\Like;
use App\Entity\User;
use App\Entity\Image;
use App\Entity\Recipe;
use App\Form\RecipeType;
use App\Repository\LikeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class RecipeController extends AbstractController
{
    /**
     * @Route("/recipe", name="recipe")
     */
    public function index(): Response
    {
        return $this->render('recipe/index.html.twig', []);
    }

    /**
     * @Route("/recipe/new", name="recipe_create")
     * @Route("/recipe/edit/{id}", name="recipe_edit")
     */
    public function create(Recipe $recipe = null, EntityManagerInterface $em, Request $request, SluggerInterface $slugger): Response
    {
        $user = $this->getUser();

        if (!$recipe) {
            $recipe = new Recipe();
        } else if (!$user || $recipe->getUser() !== $user && !in_array('ROLE_ADMIN', $user->getRoles())) {
            //If User isn't Admin or Author, he is denied access to Edit mode
            return $this->redirectToRoute('kuhnya_index');
        }

        $recipeForm = $this->createForm(RecipeType::class, $recipe);

        $recipeForm->handleRequest($request);

        if ($recipeForm->isSubmitted() && $recipeForm->isValid()) {

            if (!$recipe->getid()) {
                $recipe->setCreatedAt(new \DateTime());
            }

            if(!$recipe->getUser()){
                $recipe->setUser($user);
            }

            $recipe->setSlug($slugger->slug($recipe->getTitle()));


            $files = $recipeForm['images']->getData();

            $uploads_directory = $this->getParameter('uploads_directory');
            $count = count($recipe->getImages());

            foreach ($files as $file) {
                $count++;
                $imageName = $recipe->getSlug() . $count . '.' . $file->guessExtension();

                try {
                    $file->move(
                        $uploads_directory . "/recipesImg",
                        $imageName
                    );
                } catch (FileException $e) {
                    if ($recipe->getId()) {
                        return $this->redirectToRoute('recipe_edit', ['id' => $recipe->getId()]);
                    } else {
                        return $this->redirectToRoute('recipe_create');
                    }
                }
                //Creating new Image Entity and linking them to current Recipe
                $newImage = new Image();
                $newImage->setName($imageName)
                    ->setDescription($imageName)
                    ->setRecipe($recipe);

                $em->persist($newImage);
            }

            $em->persist($recipe);
            $em->flush();

            return $this->redirectToRoute('kuhnya_show', ['slug' => $recipe->getSlug()]);
        }

        return $this->render('recipe/create.html.twig', [
            'recipeForm' => $recipeForm->createView(),
            'editMode' => $recipe->getId()
        ]);
    }

    /**
     * @Route("/recipe/delete/{id}", name="recipe_delete")
     */
    public function delete(Recipe $recipe, EntityManagerInterface $em): Response
    {
        $user = $this->getUser();
        if (!$user || $user !== $recipe->getUser() && !in_array('ROLE_ADMIN', $user->getRoles())) {
            return $this->redirectToRoute("kuhnya_index");
        }

        $filesystem = new Filesystem();

        foreach ($recipe->getImages() as $image) {
            if ($image->getName() !== "notfound.jpg") {
                $filesystem->remove($image->getPath());
                $em->remove($image);
            }
        }

        $em->remove($recipe);
        $em->flush();
        if(!in_array('ROLE_ADMIN', $user->getRoles())){

            return $this->redirectToRoute('kuhnya_showByAuthor', [
                'username' => $user->getUsername()
            ]);
        }

        return $this->redirectToRoute('admin_recipes');
    }

    /**
     * Permet de donner ou modifier une note à une Recette
     *@Route("/recipe/{id}/{rating}", name="recipe_like")
     * 
     * @param Recipe $recipe
     * @param EntityManagerInterface $em
     * @param LikeRepository $likeRepo
     * @return Response
     */
    public function like(Recipe $recipe, int $rating, EntityManagerInterface $em, LikeRepository $likeRepo, Request $request): Response
    {
        $user = $this->getUser();
        //Rating must be an Integer comprised between 1 and 5
        if (!$user || $rating > 5 || $rating < 1 || gettype($rating) !== "integer") return $this->json([
            'message' => 'Unauthorized'
        ], 403);

        //If Recipe is already Liked, we update the Like instead of creating a new one
        if ($recipe->isLikedByUser($user)) {
            $like = $likeRepo->findOneBy([
                'recipe' => $recipe,
                'user' => $user
            ]);
        } else {
            $like = new Like();
            $like->setUser($user)
                ->setRecipe($recipe);
        }

        $like->setRating($rating);

        $em->persist($like);
        $em->flush();
        return $this->json([
            "likes" => count($likeRepo->findBy(['recipe' => $recipe])),
            "rating" => $rating,
            "average" => $recipe->getAvgRating(),
            "message" => "Rating successfully registered"
        ], 200);
    }
}
