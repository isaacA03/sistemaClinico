
let elemento;
elemento=document;
elemento=document.head;

elemento=document.body;
elemento=document.forms;

console.log(elemento);
console.log(elemento[0]);


//Validacion de formulario//
const formulario = document.getElementById('formulario');

//Obtenemos cada uno de los campos del formulario//
const nombres =document.getElementById('nombres');
const apellidos =document.getElementById('apellidos');
const sexo =document.getElementById('sexo');
const fecha =document.getElementById('fecha');
const edad =document.getElementById('edad');
const civil =document.getElementById('civil');
const nacionalidad =document.getElementById('nacionalidad');
const direccion =document.getElementById('direccion');
const ocupacion =document.getElementById('ocupacion');



//Se maneja el evento para enviar al formulario//
formulario.addEventListener('submit',function(e){

//Evitamos que la pagina se recargue//
e.preventDefault();    //Nos trae un error por defecto//
console.log("Enviando formulario...");
})

//Agregamos un evento para validar cuando el campo de entrada cambia de valor//
nombres.addEventListener('change', function(e){
    let longitud = e.target.value;

    //Validamos que el campo sea obligatorio//
    if(longitud.trim().length==0){
        console.log("El campo nombre es obligatorio");
    }

})







