<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Recipe;
use App\Entity\Comment;
use App\Entity\Category;
use App\Entity\Ingredient;
use App\Form\CategoryType;
use App\Form\IngredientType;
use App\Repository\UserRepository;
use App\Repository\RecipeRepository;
use App\Repository\CommentRepository;
use App\Repository\CategoryRepository;
use App\Repository\IngredientRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdminController extends AbstractController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'AdminController',
        ]);
    }

    /**
     * @Route("/admin/recipes", name="admin_recipes")
     */
    public function recipes(RecipeRepository $repo, PaginatorInterface $paginator, Request $request): Response
    {
        $recipes = $paginator->paginate(
            $repo->findBy([], ['createdAt' => 'DESC']),
            $request->query->getInt('page', 1),
            8
        );

        return $this->render('admin/recipeManager.html.twig', [
            'recipes' => $recipes
        ]); 
    }

    /**
     * @Route("/admin/comments", name="admin_comments")
     */
    public function comments(CommentRepository $repo, PaginatorInterface $paginator, Request $request): Response
    {
        $comments = $paginator->paginate(
            $repo->findBy([], ['createdAt' => 'DESC']),
            $request->query->getInt('page', 1),
            8
        );

        return $this->render('admin/commentManager.html.twig', [
            'comments' => $comments
        ]);
    }

    /**
     * @Route("/admin/comments/edit/{id}", name="admin_comments_edit")
     */
    public function commentsEdit(Comment $comment, EntityManagerInterface $em): Response
    {
        $comment->setValidated(true);
        $em->persist($comment);
        $em->flush();

        return $this->redirectToRoute('admin_comments');
    }

    /**
     * @Route("/admin/comments/delete/{id}", name="admin_comments_delete")
     */
    public function commentsDelete(Comment $comment, EntityManagerInterface $em): Response
    {
        $em->remove($comment);
        $em->flush();
        return $this->redirectToRoute('admin_comments');
    }

    /**
     * @Route("/admin/users", name="admin_users")
     */
    public function users(UserRepository $repo, PaginatorInterface $paginator, Request $request): Response
    {
        $users = $paginator->paginate(
            $repo->findBy([], ['createdAt' => 'DESC']),
            $request->query->getInt('page', 1),
            8
        );

        return $this->render('admin/userManager.html.twig', [
            'users' => $users
        ]); 
    }

    /**
     * @Route("/admin/users/delete/{id}", name="admin_users_delete")
     */
    public function usersDelete(User $user, EntityManagerInterface $em): Response
    {
        if(in_array('ROLE_ADMIN', $user->getRoles())){
            return $this->json([
                'message' => 'Unauthorized'
            ], 403);
        }

        //If User is Active, they become blocked. If they were blocked, they become active.
        if($user->getActive()) $user->setActive(false);
        else $user->setActive(true);
        
        $em->persist($user);
        $em->flush();
        return $this->redirectToRoute('admin_users');
    }

    /**
     * @Route("/admin/users/promote/{id}", name="admin_users_promote")
     */
    public function usersPromote(User $user, EntityManagerInterface $em): Response
    {
        if(in_array('ROLE_ADMIN', $user->getRoles())){
            return $this->json([
                'message' => 'Unauthorized'
            ], 403);
        }

        //If User is Editor, they lose their privileges, if not, they become one
        if(count($user->getRolesArray()) === 0) $user->setRoles(['ROLE_EDITOR']);
        else $user->setRoles([]);
        
        $em->persist($user);
        $em->flush();
        return $this->redirectToRoute('admin_users');
    }

     /**
     * @Route("/admin/categories", name="admin_categories")
     */
    public function categories(CategoryRepository $repo, PaginatorInterface $paginator, Request $request): Response
    {
        $categories = $paginator->paginate(
            $repo->findAll(),
            $request->query->getInt('page', 1),
            8
        );

        return $this->render('admin/categoryManager.html.twig', [
            'categories' => $categories
        ]); 
    }

    /**
     * @Route("admin/categories/new", name="admin_categories_create")
     * @Route("admin/categories/edit/{id}", name="admin_categories_edit")
     */
    public function categoriesEdit(Category $category = null, EntityManagerInterface $em, Request $request): Response
    {
        if(!$category){
            $category = new Category();
        }

        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $em->persist($category);
            $em->flush();
            return $this->redirectToRoute("admin_categories");
        }

        return $this->render("category/create.html.twig", [
            'category' => $category,
            'form' => $form->createView(),
            'editMode' => $category->getId()
        ]);
    }

    /**
     * @Route("/admin/categories/delete/{id}", name="admin_categories_delete")
     */
    public function categoriesDelete(Category $category, EntityManagerInterface $em): Response
    {
        $em->remove($category);
        $em->flush();
        return $this->redirectToRoute('admin_categories');
    }

     /**
     * @Route("/admin/ingredients", name="admin_ingredients")
     */
    public function ingredients(IngredientRepository $repo, PaginatorInterface $paginator, Request $request): Response
    {
        $ingredients = $paginator->paginate(
            $repo->findAll(),
            $request->query->getInt('page', 1),
            8
        );

        return $this->render('admin/ingredientManager.html.twig', [
            'ingredients' => $ingredients
        ]); 
    }

    /**
     * @Route("admin/ingredients/new", name="admin_ingredients_create")
     * @Route("/admin/ingredients/edit/{id}", name="admin_ingredients_edit")
     */
    public function ingredientsEdit(Ingredient $ingredient = null, EntityManagerInterface $em, Request $request): Response
    {
        if(!$ingredient){
            $ingredient = new Ingredient();
        }

        $form = $this->createForm(IngredientType::class, $ingredient);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $em->persist($ingredient);
            $em->flush();
            return $this->redirectToRoute("admin_ingredients");
        }

        return $this->render("ingredient/create.html.twig", [
            'ingredient' => $ingredient,
            'form' => $form->createView(),
            'editMode' => $ingredient->getId()
        ]);
    }

    /**
     * @Route("/admin/ingredients/delete/{id}", name="admin_ingredients_delete")
     */
    public function ingredientsDelete(Ingredient $ingredient, EntityManagerInterface $em): Response
    {
        $em->remove($ingredient);
        $em->flush();
        return $this->redirectToRoute('admin_ingredients');
    }
}
