<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Recipe;
use App\Entity\Comment;
use App\Form\CommentType;
use App\Entity\RecipeSearch;
use App\Form\RecipeSearchType;
use Symfony\Component\Mime\Email;
use App\Repository\RecipeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class KuhnyaController extends AbstractController
{
    /**
     * @Route("/", name="kuhnya_index")
     */
    public function index(RecipeRepository $repo): Response
    {
        $recipes = $repo->findAll(); 
        $recipe = $recipes[mt_rand(1, count($recipes)-1)];
        return $this->render('kuhnya/index.html.twig', [
            'recipe' => $recipe
        ]);
    }

    /**
     * @Route("/recettes", name="kuhnya_showAll")
     */
    public function showAll(RecipeRepository $repo, PaginatorInterface $paginator, Request $request): Response
    {
        $search = new RecipeSearch();
        $searchForm = $this->createForm(RecipeSearchType::class, $search);
        $searchForm->handleRequest($request);
        
        $recipes = $paginator->paginate(
            $repo->findByCustomSearch($search),
            $request->query->getInt('page', 1),
            6
        );

        return $this->render('kuhnya/recettes.html.twig', [
            'recipes' => $recipes,
            'search_form' => $searchForm->createView()
        ]);
    }

    /**
     * @Route("/recettes/auteur/{username}", name="kuhnya_showByAuthor")
     */
    public function showByAuthor(User $user, RecipeRepository $repo, PaginatorInterface $paginator, Request $request): Response
    {
        $search = new RecipeSearch();
        $searchForm = $this->createForm(RecipeSearchType::class, $search);
        $searchForm->handleRequest($request);

        $recipes = $paginator->paginate(
            $repo->findByUser($user),
            $request->query->getInt('page', 1),
            6
        );

        return $this->render('kuhnya/recettes.html.twig', [
            'recipes' => $recipes,
            'search_form' => $searchForm->createView(),
            'author' => $user
        ]);
    }

    /**
     * @Route("/recettes/{slug}", name="kuhnya_show")
     */
    public function show(Recipe $recipe, Request $request, EntityManagerInterface $em): Response
    {
        $comment = new Comment();
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        
        if($form->isSubmitted() && $form->isValid() && $this->getUser()){
            $user = $this->getUser();
            $comment->setUser($user)
                    ->setRecipe($recipe)
                    ->setValidated(false) 
                    ->setCreatedAt(new \DateTime());

            $em->persist($comment);
            $em->flush();

            //Updating flash msg to inform the User
            $this->addFlash("comment_success", "Commentaire Bien enregistré ! Il apparaitra après validation de l'Administrateur !");
        }

        return $this->render('kuhnya/recette.html.twig', [
            'recipe' => $recipe,
            'form' => $form->createView()
        ]);
    }

    /**
     *@Route("/bestof", name="kuhnya_bestof")
     */
    public function bestof(RecipeRepository $repo): Response{
        $recipes = $repo->findAll();
        usort($recipes, fn($a, $b)=> $a->getAvgRating() < $b->getAvgRating());
        $top = array_slice($recipes, 0, 10);

        return $this->render('kuhnya/bestof.html.twig',[
            'recipes' => $top
        ]);
    }
}
