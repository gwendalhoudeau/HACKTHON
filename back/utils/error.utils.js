module.exports.signUpErrors = (err) => {
    let errors = {pseudo: '', email:'', password: ''}

    if (err.message.includes('pseudo'))
        errors.pseudo = "Pseudo incorrect ou déjà prit"

    if (err.message.includes('email'))
        errors.email = "Email incorrect ou déjà prit"

    if (err.message.includes('password'))
        errors.password = "Le mot de passe doit contenir au moins 6 caractères"

    if(err.code == 11000 && Object.keys(err.keyValue)[0].includes("pseudo"))
        errors.email = 'Ce pseudo est déjà utilisé'

    if(err.code == 11000 && Object.keys(err.keyValue)[0].includes("email"))
        errors.email = 'Cet email est déjà utilisé'
    return errors
}

module.exports.signInErrors = (err) =>{
    let error = {email:'',password:''}

    if(err.message.includes('email')) error.email = "Email inconnu"
    if(err.message.includes('password')) error.password = "Mot de passe incorrect"

    return error
}
