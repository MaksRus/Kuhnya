<?php

namespace App\Controller;

use App\Entity\User;
use App\Helpers\Recaptcha;
use App\Form\RegistrationType;
use Symfony\Component\Mime\Email;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class SecurityController extends AbstractController
{
    /**
     * @Route("/inscription", name="security_registration")
     */
    public function registration(Request $request, EntityManagerInterface $em, UserPasswordEncoderInterface $encoder, SluggerInterface $slugger, MailerInterface $mailer): Response
    {
        $user = new User();
        $form = $this->createForm(RegistrationType::class, $user);

        $form->handleRequest($request);
        
        if($form->isSubmitted() && $form->isValid()){
            //Captcha check
            $captcha = new Recaptcha("6Lc5SOoZAAAAAD-CKELgIVhIYTY8GRh6WVIguDg4");
            $captchaCode = $request->get('g-recaptcha-response');

            if($captcha->checkCode($captchaCode)){
                $hash = $encoder->encodePassword($user, $user->getPassword());
                //Manage Uploading User Avatar
                $avatarFile = $form->get('avatar')->getData();
                
                $uploads_directory = $this->getParameter('uploads_directory');
    
                $avatarName = $slugger->slug($user->getUsername()) . '.' .$avatarFile->guessExtension();
    
                try{
                    $avatarFile->move(
                        $uploads_directory."/userAvatar",
                        $avatarName
                    );
                } catch( FileException $e){
    
                    return $this->redirectToRoute('security_registration');
                }

                //generating verification key
                $vkey = md5(time());
    
                $user->setPassword($hash)
                    ->setCreatedAt(new \DateTime())
                    ->setActive(false)
                    ->setVkey($vkey)
                    ->setAvatar($avatarName);
    
                $em->persist($user);
                $em->flush();

                //Sending confirmation Mail
                $email = new TemplatedEmail();
                $email->from('kuhnya@exemple.com')
                        ->to($user->getEmail())
                        ->subject("Confirmez votre Inscription !")
                        ->htmlTemplate('email/confirmRegistration.html.twig')
                        ->context([
                            'user' => $user->getUsername(),
                            'vkey' => $user->getVkey()
                        ]);

                $mailer->send($email);

                $this->addFlash('registration_ok', "Un mail de confirmation vient d'être envoyé à l'adresse indiquée !");
    
                return $this->redirectToRoute('kuhnya_index');
            }
        }
        
        return $this->render('security/registration.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     *@Route("/inscription/verify/{key}", name="security_verify")
     */
    public function verify(string $key = null, UserRepository $repo, EntityManagerInterface $em){
        $user = $repo->findOneBy(["active" => false, "vkey" => $key]);

        /*Editing the vkey of already activated User to NULL so that they can't use the same link to
        re-activate their account in case they get banned by Amin*/
        if($user && $user->getVkey()){
            $user->setVkey(null)
                ->setActive(true);
                
            $em->persist($user);
            $em->flush();

            $this->addFlash("registration_verified", "Compte activé avec succès ! Il ne reste plus qu'à vous connecter !");
        }

        return $this->render('security/login.html.twig');
    }

    /**
     *@Route("/connexion", name="security_login")
     */
    public function login(){
        return $this->render('security/login.html.twig');
    }

    /**
     *@Route("/deconnexion", name="security_logout")
     */
    public function logout(){}
}
