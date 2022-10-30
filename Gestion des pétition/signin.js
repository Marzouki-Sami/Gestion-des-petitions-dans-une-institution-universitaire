//controle de la saisie du formulaire fsign si il y a un erreur on affiche un message d'erreur avec alert et on bloque le formulaire
 document.fsign.addEventListener("submit",function(e){    
     if(!validesignin()){
         e.preventDefault();
     }
 }
 );

//crée une fontion qui permet de verifier si le chapms nom est composé de caractère alphabétique

function alphanum(ch){
    if(ch.value.length > 10){
        for( i=0;i<ch.value.length;i++){
            if(ch.chartAt(i).toUpperCase() < 'A' || ch.chartAt(i).toUpperCase() > 'Z' || ch.chartAt(i).toUpperCase() < '0' || ch.chartAt(i).toUpperCase() > '9')
                return true;    
            }
        }
        return false;
    }

function alphab(ch){

    if(ch.value.length > 10){
        for( i=0;i<ch.value.length;i++){
            if(ch.chartAt(i).toUpperCase() < 'A' || ch.chartAt(i).toUpperCase() > 'Z')
                return true;    
            }
        }
        return false;
    }

    function mail(ch){
        if((ch.value.indexOf("@") == -1 || ch.value.indexOf(".") == -1) || (ch.value.indexOf("@") > ch.value.indexOf("."))|| (ch.value.indexOf("@") == 0) || (ch.value.indexOf(".") == 0) || (ch.value.indexOf("@") == ch.value.length-1) || (ch.value.indexOf(".") == ch.value.length-1)|| (ch.value.indexOf("@") == ch.value.indexOf(".")-1) || (ch.value.indexOf("@") == ch.value.indexOf(".")+1)){
            return false;
        }
        else{
            ch1=ch.value.substring(0,ch.value.indexOf("@"));
            ch2=ch.value.substring(ch.value.indexOf("@")+1,ch.value.indexOf("."));
            ch3=ch.value.substring(ch.value.indexOf(".")+1,ch.value.length);

            if(!ch1.alphanum())
                return false;
            if(!ch2.alphanum())
                return false;
            if(!ch3.alphanum())
                return false;
            return true;

        }
    }


 function validesignin(){
     let nom = document.getElementById("nom").value;
     let prenom = document.getElementById("pnom").value;
     let mdp = document.getElementById("mdp").value;
     let regex = /^[a-zA-Z ]+$/;
     if(!regex.test(nom)){
         alert("le nom doit être composé de caractère alphabétique");
         return false;
     }
     if(!regex.test(prenom)){
         alert("le prenom doit être composé de caractère alphabétique");
         return false;
     }
     if(mdp.length < 8){
         alert("le mot de passe doit être composé de 8 caractère minimum");
         return false;
     }
    if(mdp != document.getElementById("cmdp").value){
        alert("le mot de passe et le mot de passe de confirmation ne sont pas identique");
        return false;
    }
     return true;
 }
