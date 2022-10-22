let elemento;
elemento=document;
elemento=document.head;

elemento=document.body;
elemento=document.forms;

console.log(elemento);
console.log(elemento[0]);


//Se maneja el evento para enviar al formulario//
formulario.addEventListener('submit',function(e){

    //Evitamos que la pagina se recargue//
    e.preventDefault();    //Nos trae un error por defecto//
    console.log("Enviando formulario...");
    })




    
   
//MOSTRAR CONTRASEÑA//
document.querySelector('.campo span').addEventListener('click', e => {
    const passwordInput = document.querySelector('#password');
    if (e.target.classList.contains('show')) {
        e.target.classList.remove('show');
        e.target.textContent = 'Ocultar';
        passwordInput.type = 'text';
    } else {
        e.target.classList.add('show');
        e.target.textContent = 'Mostrar';
        passwordInput.type = 'password';
    }
});
//QUE NO HALLAN ESPACIOS EN BLANCO














    //---------------------------------------------//

    
    //Agregamos un evento para validar cuando el campo de entrada cambia de valor EMAIL//
    email.addEventListener('change', function(e){
        let longitud = e.target.value;
    
        //Validamos que el campo sea obligatorio//
        if(longitud.trim().length==0){
            console.log("El campo email es obligatorio");
        }

    })

    //Agregamos un evento para validar cuando el campo de entrada cambia de valor EMAIL//
    password.addEventListener('change', function(e){
        let longitud = e.target.value;
    
        //Validamos que el campo sea obligatorio//
        if(longitud.trim().length==0){
            console.log("El campo password es obligatorio");
        }


    })