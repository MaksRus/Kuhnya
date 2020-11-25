<?php

namespace App\Form;

use App\Entity\Ingredient;
use App\Entity\RecipeIngredient;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\NumberType;

class RecipeIngredientType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('quantity', NumberType::class, [
                'required' => true,
                'label' => 'Quantité',
                'attr' => [
                    'class' => 'col'
                ]
            ])
            //->add('recipe')
            ->add('ingredient', EntityType::class, [
                'class' => Ingredient::class,
                'choice_label' => function($ingredient){
                    return $ingredient->getLabel();
                },
                'label' => "Ingrédient",
                'attr' => [
                    'class' => 'col'
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => RecipeIngredient::class,
        ]);
    }
}
