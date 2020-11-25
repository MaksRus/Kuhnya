<?php

namespace App\Repository;

use App\Entity\Recipe;
use App\Entity\RecipeSearch;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;

/**
 * @method Recipe|null find($id, $lockMode = null, $lockVersion = null)
 * @method Recipe|null findOneBy(array $criteria, array $orderBy = null)
 * @method Recipe[]    findAll()
 * @method Recipe[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RecipeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Recipe::class);
    }


    public function findByCustomSearch(RecipeSearch $search){
        $query = $this->createQueryBuilder('r');
        $query->select('r', 'c')
            ->join('r.categories', 'c');

        if($search->getName()){
            $query->andWhere('r.title LIKE :searchName')
                ->setParameter("searchName", '%'.$search->getName().'%');
        }

        if($search->getLevel()){
            $query->andWhere('r.level = :levelSearch')
                ->setParameter('levelSearch', $search->getLevel());
        }
        

        if($search->getCategories() && !$search->getCategories()->isEmpty()){
                $query->andWhere('c.id IN (:categoriesSearch)')
                    ->setParameter(':categoriesSearch', $search->getCategories());
        }
        
        return $query->orderBy('r.createdAt', "DESC")->getQuery()->getResult();
    }

    // /**
    //  * @return Recipe[] Returns an array of Recipe objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('r.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Recipe
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
