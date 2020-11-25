<?php

namespace App\Repository;

use App\Entity\Prep;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Prep|null find($id, $lockMode = null, $lockVersion = null)
 * @method Prep|null findOneBy(array $criteria, array $orderBy = null)
 * @method Prep[]    findAll()
 * @method Prep[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PrepRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Prep::class);
    }

    // /**
    //  * @return Prep[] Returns an array of Prep objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Prep
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
