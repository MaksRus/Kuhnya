<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\ChangeAvatarType;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class ProfileController extends AbstractController
{
    /**
     * @Route("/profile/{username}", name="profile")
     */
    public function index(User $user = null, Request $request): Response
    {
        $currentUser = $this->getUser();
        
        $form = $this->createForm(ChangeAvatarType::class, $currentUser);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $avatarFile = $form->get('avatar')->getData();
            $uploads_directory = $this->getParameter('uploads_directory');

            try{
                $avatarFile->move(
                    $uploads_directory."/userAvatar",
                    $currentUser->getAvatar()
                );
            } catch( FileException $e){

                return $this->redirectToRoute('security_registration');
            }
            
            return $this->redirectToRoute('profile', ['username' => $currentUser->getUsername()]);
        }
        
        return $this->render('profile/index.html.twig', [
            'user' => $user,
            'form' => $form->createView()
        ]);
    }
}
