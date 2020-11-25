<?php

namespace App\DataFixtures;

use Faker\Factory;
use App\Entity\Like;
use App\Entity\Prep;
use App\Entity\User;
use App\Entity\Image;
use App\Entity\Level;
use App\Entity\Budget;
use App\Entity\Recipe;
use App\Entity\Comment;
use App\Entity\Category;
use App\Entity\Ingredient;
use App\Entity\RecipeIngredient;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class RecipeFixtures extends Fixture
{

    private $faker;
    private $encoder;

    public function __construct(UserPasswordEncoderInterface $encoder) {
        $this->faker = Factory::create('fr_FR');
        $this->encoder = $encoder;
    }
    
    public function load(ObjectManager $manager)
    {
        $users = [];
        $categories = [];
        $budgets = [];
        $preps = [];
        $levels = [];
        $ingredients = [];

        //Créer des USERS
        for ($i = 1; $i<=5; $i++){
            $user = new User();

            $user->setUsername($this->faker->firstName())
                ->setEmail("plop$i@plop.fr")
                ->setPassword($this->encoder->encodePassword($user, 'coucou'))
                ->setCreatedAt($this->faker->dateTimeBetween('-3 months'))
                ->setAvatar("avatar$i.jpg")
                ->setActive(true);

            $users[] = $user;
            $manager->persist($user);
        }

        //Créer des CATEGORIES
        for($j = 0; $j<8; $j++){
            $category = new Category();
            
            $category->setTitle("category$j")
                ->setDescription($this->faker->sentence(14, 3));

            $categories[] = $category;
            $manager->persist($category);
        }

        //Créer des LEVELS
        $levelnames = ["Facile", "Intermédiaire", "Difficile"];
        for($k = 0; $k<3; $k++){
            $level = new Level();
            
            $level->setName($levelnames[$k]);

            $levels[] = $level;
            $manager->persist($level);
        }

        //Créer des PREP
        for($l = 1; $l<=6; $l++){
            $prep = new Prep();
            
            $prep->setTime(15*$l);

            $preps[] = $prep;
            $manager->persist($prep);
        }

        //Créer des BUDGETS
        $budgetnames = ["Cheapos", "Standard", "Luxe"];
        for($p = 0; $p<3; $p++){
            $budget = new Budget();
            
            $budget->setName($budgetnames[$p]);

            $budgets[] = $budget;
            $manager->persist($budget);
        }

        //Créer des INGREDIENTS
        for($m = 0; $m<20; $m++){
            $ingredient = new Ingredient();
            
            $ingredient->setName($this->faker->lastName())
                ->setunit($this->faker->randomElement(['gr', "kg", "l", ""]));

            $ingredients[] = $ingredient;
            $manager->persist($ingredient);
        }

        
        //Créer des RECIPES
        for($x = 0; $x <= 20; $x++){
            $recipe = new Recipe();
            $title = $this->faker->sentence(3, 1);
            $slug = strtolower(trim(preg_replace(
                '/[\s-]+/', '-', 
                preg_replace('/[^A-Za-z0-9-]+/'
                , '-', 
                preg_replace('/[&]/', 'and', preg_replace('/[\']/', '', iconv('UTF-8', 'ASCII//TRANSLIT', $title))))), '-'));
            
            $content = '<p>'. join($this->faker->paragraphs(5), '</p><p>') . '</p>';

            $recipe->setTitle($title)
                ->setSlug($slug)
                ->setUser($this->faker->randomElement($users))
                ->setDescription($content)
                ->setLevel($this->faker->randomElement($levels))
                ->setBudget($this->faker->randomElement($budgets))
                ->setPrepTime($this->faker->randomElement($preps))
                ->setGuestsNb($this->faker->randomElement([2, 4, 6, 8]))
                ->setCreatedAt($this->faker->dateTimeBetween('-6 months'));

            //On ajoute des Catégories
            for($y = 0; $y< mt_rand(1, 5); $y++){
                $recipe->addCategory($this->faker->randomElement($categories));
            }
            
            //Créer des COMMENTAIRES
            for($v = 0; $v<= mt_rand(2,8); $v++){
                $comment = new Comment();

                $days = (new \DateTime())->diff($recipe->getCreatedAt())->days;

                $comment->setUser($this->faker->randomElement($users))
                    ->setRecipe($recipe)
                    ->setContent($this->faker->paragraph(2))
                    ->setCreatedAt($this->faker->dateTimeBetween('-' . $days . ' days'))
                    ->setValidated(true);
                
                    $manager->persist($comment);

                $recipe->addComment($comment);
            }
            //Créer des LIKES
            for($w = 0; $w<= mt_rand(2,8); $w++){
                $like = new Like();

                $like->setUser($this->faker->randomElement($users))
                    ->setRecipe($recipe)
                    ->setRating((int) ceil($this->faker->numberBetween(1,5)));
                
                    $manager->persist($like);

                $recipe->addLike($like);
            }
            //Créer des IMAGES
            for($n = 0; $n <= mt_rand(0,3); $n++){
                $image = new Image();

                $image->setName($this->faker->imageUrl())
                    ->setDescription($this->faker->paragraph(4))
                    ->setRecipe($recipe);
                
                $manager->persist($image);
            }
            //AJOUTER DES INGREDIENTS A LA RECETTE AVEC QUANTITE
            for($b=0; $b <= mt_rand(2,8); $b++){
                $quantite = new RecipeIngredient();

                $quantite->setRecipe($recipe)
                    ->setIngredient($this->faker->randomElement($ingredients))
                    ->setQuantity($this->faker->numberBetween(0, 10));
                
                $manager->persist($quantite);
            }

            $manager->persist($recipe);
        }

        $manager->flush();
    }
}
