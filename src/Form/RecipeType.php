<?php

namespace App\Form;

use App\Entity\Prep;
use App\Entity\Level;
use App\Entity\Budget;
use App\Entity\Recipe;
use App\Form\ImageType;
use App\Entity\Category;
use App\Entity\RecipeIngredient;
use App\Form\RecipeIngredientType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\All;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;

class RecipeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title', TextType::class, [
                'label' => "Titre de la Recette",
                'required' => true,
                'attr' => [
                    'placeholder' => "Saisissez le Titre de votre recette"
                ]
            ])
            //->add('slug')
            ->add('description')
            ->add('guestsNb')
            //->add('createdAt')
            //->add('user')
            ->add('level', EntityType::class, [
                'class' => Level::class,
                'choice_label' => 'name'
            ])
            ->add('prepTime', EntityType::class, [
                'class' => Prep::class,
                'choice_label' => 'time'
            ])
            ->add('categories', EntityType::class, [
                'class' => Category::class,
                'choice_label' => 'title',
                'label' => "Catégorie",
                'multiple' => true,
                'expanded' => true
            ])
            ->add('budget', EntityType::class, [
                'class' => Budget::class,
                'choice_label' => 'name'
            ])
            ->add('recipeIngredients', CollectionType::class, [
                'entry_type' => RecipeIngredientType::class,
                'entry_options' => ['label' => false],
                'by_reference' => false,
                'allow_add' => true,
                'allow_delete' => true,
                'label' => false
            ])
            ->add('images', FileType::class, [
                'label' => 'Images (jpg, png)',
                'mapped' => false,
                'multiple' => true,
                'required' => false,
                'attr' => [
                    'accept' => 'image/*',
                    'multiple' => 'multiple'
                ],
                'constraints' => [
                    new All([
                        new File([
                            'mimeTypes' => [
                                'image/jpeg',
                                'image/png'
                            ],
                            'maxSize' => '1024k'
                        ])
                    ])
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Recipe::class,
        ]);
    }
}