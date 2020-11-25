<?php
namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;

class RecipeSearch{

    /**
     *
     * @var string|null
     */
    private $name;

    /**
     * @var Level|null
     */
    private $level;

    /**
     * Undocumented variable
     *
     * @var ArrayCollection|null
     */
    private $categories;

   

    /**
     * Get the value of level
     *
     * @return  Level|null
     */ 
    public function getLevel()
    {
        return $this->level;
    }

    /**
     * Set the value of level
     *
     * @param  Level  $level
     *
     * @return  self
     */ 
    public function setLevel(Level $level)
    {
        $this->level = $level;

        return $this;
    }

    /**
     * Get the value of prepTime
     *
     * @return  Prep|null
     */ 
    public function getPrepTime()
    {
        return $this->prepTime;
    }

    /**
     * Set the value of prepTime
     *
     * @param  Prep  $prepTime
     *
     * @return  self
     */ 
    public function setPrepTime(Prep $prepTime)
    {
        $this->prepTime = $prepTime;

        return $this;
    }

    /**
     * Get the value of name
     *
     * @return  string|null
     */ 
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set the value of name
     *
     * @param  string|null  $name
     *
     * @return  self
     */ 
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get undocumented variable
     *
     * @return ArrayCollection|null
     */ 
    public function getCategories()
    {
        return $this->categories;
    }

    /**
     * Set undocumented variable
     *
     * @param  ArrayCollection|null  $categories  Undocumented variable
     *
     * @return  self
     */ 
    public function setCategories($categories)
    {
        $this->categories = $categories;

        return $this;
    }
}