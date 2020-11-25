<?php
namespace App\DataPersister;

use App\Entity\Recipe;
use ApiPlatform\Core\DataPersister\DataPersisterInterface;
use Doctrine\ORM\EntityManagerInterface;

class RecipePersister implements DataPersisterInterface{

    protected $em;

    public function __construct(EntityManagerInterface $em){
        $this->em = $em;
    }

    public function supports($data): bool {
        return $data instanceof Recipe;
    }

    public function persist($data){
        //Set CreatedAt
        $data->setCreatedAt(new \DateTime());

        //Persist with Doctrine
        $this->em->persist($data);
        $this->em->flush();
    }

    public function remove($data){
        //ask doctrine to delete
        $this->em->remove($data);
        $this->em->flush();
    }
}