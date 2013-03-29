/**
 * @class Lang
 * @extends --
 * This is the definition class for the languages of the application
 */
 Ext.define('Core.Lang', {
    es:{
        appName: 'Cursame',
        sorryMsg:'¡Lo sentimos, algo salio mal! :(',
        erase:'Eliminar',
        accept:'Aceptar',
        decline:'Rechazar',
        members:'Comunidad',
        name:'Nombre',
        description:'Descripción',
        save:'Guardar',
        saving:'Guardando ...',
        email:'Email',
        password:'Contraseña',
        login:'Iniciar Sesión',
        starting :'Iniciando ...',
        passwordRecover:'Recuperar Contraseña',
        passwordRecoverEmail:'Escribe tu Email',
        send:'Enviar',
        courses:'Cursos',
        loading:'Cargando ...'
    }
});

 var Lang = Ext.create('Core.Lang'),
 lang = Lang.es;

