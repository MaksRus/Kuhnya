<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\RecipeRepository;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Api\FilterInterface;
use Doctrine\Common\Collections\Collection;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;

/**
 * @ORM\Entity(repositoryClass=RecipeRepository::class)
 * @UniqueEntity({"title"}, message="Cette Recette existe déjà !")
 * @ApiResource(
 *      attributes={
 *          "order"={"createdAt" : "DESC"},
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
class Recipe
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups({"read:recipe"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"read:recipe"})
     */
    private $title;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $slug;

    /**
     * @ORM\Column(type="text")
     * @Groups({"read:recipe"})
     */
    private $description;

    /**
     * @ORM\Column(type="integer")
     * @Assert\Range(min=1, max=20, minMessage="Choississez un nombre compris entre 1 et 20",
     * maxMessage="Choississez un nombre compris entre 1 et 20")
     * @Groups({"read:recipe"})
     */
    private $guestsNb;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"read:recipe"})
     */
    private $createdAt;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="recipes")
     * @ORM\JoinColumn(nullable=false)
     * @Groups({"read:recipe"})
     */
    private $user;

    /**
     * @ORM\ManyToOne(targetEntity=Level::class, inversedBy="recipes")
     * @ORM\JoinColumn(nullable=false)
     * @Groups({"read:recipe"})
     */
    private $level;

    /**
     * @ORM\ManyToOne(targetEntity=Prep::class, inversedBy="recipes")
     * @ORM\JoinColumn(nullable=false)
     * @Groups({"read:recipe"})
     */
    private $prepTime;

    /**
     * @ORM\ManyToMany(targetEntity=Category::class, inversedBy="recipes")
     * @Groups({"read:recipe"})
     */
    private $categories;

    /**
     * @ORM\ManyToOne(targetEntity=Budget::class, inversedBy="recipes")
     * @ORM\JoinColumn(nullable=false)
     * @Groups({"read:recipe"})
     */
    private $budget;

    /**
     * @ORM\OneToMany(targetEntity=Comment::class, mappedBy="recipe", orphanRemoval=true)
     * @Groups({"read:recipe"})
     */
    private $comments;

    /**
     * @ORM\OneToMany(targetEntity=Like::class, mappedBy="recipe", orphanRemoval=true)
     */
    private $likes;

    /**
     * @ORM\OneToMany(targetEntity=RecipeIngredient::class, mappedBy="recipe", orphanRemoval=true, cascade={"persist", "remove"}))
     * @Groups({"read:recipe"})
     */
    private $recipeIngredients;

    /**
     * @ORM\OneToMany(targetEntity=Image::class, mappedBy="recipe")
     */
    private $images;

    

    public function __construct()
    {
        $this->categories = new ArrayCollection();
        $this->comments = new ArrayCollection();
        $this->likes = new ArrayCollection();
        $this->recipeIngredients = new ArrayCollection();
        $this->images = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getGuestsNb(): ?int
    {
        return $this->guestsNb;
    }

    public function setGuestsNb(int $guestsNb): self
    {
        $this->guestsNb = $guestsNb;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }
    
    public function getLevel(): ?Level
    {
        return $this->level;
    }

    public function setLevel(?Level $level): self
    {
        $this->level = $level;

        return $this;
    }

    public function getPrepTime(): ?Prep
    {
        return $this->prepTime;
    }

    public function setPrepTime(?Prep $prepTime): self
    {
        $this->prepTime = $prepTime;

        return $this;
    }

    /**
     * @return Collection|Category[]
     */
    public function getCategories(): Collection
    {
        return $this->categories;
    }

    public function addCategory(Category $category): self
    {
        if (!$this->categories->contains($category)) {
            $this->categories[] = $category;
        }

        return $this;
    }

    public function removeCategory(Category $category): self
    {
        $this->categories->removeElement($category);

        return $this;
    }

    public function getBudget(): ?Budget
    {
        return $this->budget;
    }

    public function setBudget(?Budget $budget): self
    {
        $this->budget = $budget;

        return $this;
    }

    /**
     * @return Collection|Comment[]
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(Comment $comment): self
    {
        if (!$this->comments->contains($comment)) {
            $this->comments[] = $comment;
            $comment->setRecipe($this);
        }

        return $this;
    }

    public function removeComment(Comment $comment): self
    {
        if ($this->comments->removeElement($comment)) {
            // set the owning side to null (unless already changed)
            if ($comment->getRecipe() === $this) {
                $comment->setRecipe(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Like[]
     */
    public function getLikes(): Collection
    {
        return $this->likes;
    }

    public function addLike(Like $like): self
    {
        if (!$this->likes->contains($like)) {
            $this->likes[] = $like;
            $like->setRecipe($this);
        }

        return $this;
    }

    public function removeLike(Like $like): self
    {
        if ($this->likes->removeElement($like)) {
            // set the owning side to null (unless already changed)
            if ($like->getRecipe() === $this) {
                $like->setRecipe(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|RecipeIngredient[]
     */
    public function getRecipeIngredients(): Collection
    {
        return $this->recipeIngredients;
    }

    public function addRecipeIngredient(RecipeIngredient $recipeIngredient): self
    {
        if (!$this->recipeIngredients->contains($recipeIngredient)) {
            $this->recipeIngredients[] = $recipeIngredient;
            $recipeIngredient->setRecipe($this);
        }

        return $this;
    }

    public function removeRecipeIngredient(RecipeIngredient $recipeIngredient): self
    {
        if ($this->recipeIngredients->removeElement($recipeIngredient)) {
            // set the owning side to null (unless already changed)
            if ($recipeIngredient->getRecipe() === $this) {
                $recipeIngredient->setRecipe(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Image[]
     */
    public function getImages(): Collection
    {
        return $this->images;
    }

    public function addImage(Image $image): self
    {
        if (!$this->images->contains($image)) {
            $this->images[] = $image;
            $image->setRecipe($this);
        }

        return $this;
    }

    public function removeImage(Image $image): self
    {
        if ($this->images->removeElement($image)) {
            // set the owning side to null (unless already changed)
            if ($image->getRecipe() === $this) {
                $image->setRecipe(null);
            }
        }

        return $this;
    }

    /**
     * Retourne la Note Moyenne de la Recette
     *
     * @return float
     */
    public function getAvgRating(): float{
        if(count($this->likes) == 0){
            return 0;
        }
        foreach($this->likes as $like){
            $notes[] = $like->getRating();
        }
        return round (array_sum($notes) / count($notes), 2);
    }

    /**
     * Génère 5 étoiles HTML en fonction de la Note Moyenne
     *
     * @return string
     */
    public function getStars(): string{
        $avg = $this->getAvgRating();
        $stars = "";
        for($i = 1; $i<=5; $i++){
            if ($avg >= 1){
                $stars = $stars. '<a href="/recipe/' . $this->getId() . '/' . $i .'" class="js-like"><i class="fas fa-star" id="rating'.$i.'"></i></a>';
            } elseif ($avg > 0.30){
                $stars = $stars. '<a href="/recipe/' . $this->getId() . '/' . $i .'" class="js-like"><i class="fas fa-star-half-alt" id="rating'.$i.'"></i></a>';
            } else {
                $stars = $stars. '<a href="/recipe/' . $this->getId() . '/' . $i .'" class="js-like"><i class="far fa-star" id="rating'.$i.'"></i></a>';
            }
            $avg--;
        }
        return $stars;
    }

    /**
     * Permet de savoir si la recette a déjà été likée par l'utilisateur
     * et retourne la note attribuée.
     * @param User $user
     * @return int|boolean
     */
    public function isLikedByUser(User $user){
        foreach($this->likes as $like){
            if ($like->getUser() === $user){
                return $like->getRating();
            }
        }
        return false;
    }

    /**
     * Helper Function
     * Convert Recipe title to Slug
     *
     * @return string
     */
    public function toSlugg(): string{
        return strtolower(trim(preg_replace(
            '/[\s-]+/', '-', 
            preg_replace('/[^A-Za-z0-9-]+/'
            , '-', 
            preg_replace('/[&]/', 'and', preg_replace('/[\']/', '', iconv('UTF-8', 'ASCII//TRANSLIT', $this->title))))), '-'));
    }
}