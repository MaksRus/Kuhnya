<?php

namespace App\Entity;

use App\Repository\LevelRepository;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Annotation\ApiFilter;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * @ORM\Entity(repositoryClass=LevelRepository::class)
 * @UniqueEntity({"name"}, message="Cette diificulté existe déjà !")
 * @ApiResource(
 *      attributes={
 * },
 *      paginationItemsPerPage=5,
 *      normalizationContext={"groups"={"read:recipe"}},
 *      denormalizationContext={"groups"={"create:recipe"}},
 *      collectionOperations={"get"},
 *      itemOperations={"get"}
 * )
 * @ApiFilter(SearchFilter::class, 
 * properties={"post" : "exact"})
 */
class Level
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=45)
     */
    private $name;

    /**
     * @ORM\OneToMany(targetEntity=Recipe::class, mappedBy="level")
     */
    private $recipes;

    public function __construct()
    {
        $this->recipes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection|Recipe[]
     */
    public function getRecipes(): Collection
    {
        return $this->recipes;
    }

    public function addRecipe(Recipe $recipe): self
    {
        if (!$this->recipes->contains($recipe)) {
            $this->recipes[] = $recipe;
            $recipe->setLevel($this);
        }

        return $this;
    }

    public function removeRecipe(Recipe $recipe): self
    {
        if ($this->recipes->removeElement($recipe)) {
            // set the owning side to null (unless already changed)
            if ($recipe->getLevel() === $this) {
                $recipe->setLevel(null);
            }
        }

        return $this;
    }

    function __toString(){
        return (string) $this->name;
    }
}
