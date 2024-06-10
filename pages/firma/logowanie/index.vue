<template>
    <div id="root">
        <div id="blur-circle"></div>
        <div id="login-box">
            <h4 style="text-align: center;">Dla firm</h4>
            <h2>Zaloguj się do portalu</h2>
            <span class="error">{{ error_message }}</span>

            <form @submit.prevent="Login" method="post"> 
                <div>
                    <label for="email">Email:</label>
                    <input :class="{ 'input-error': error.emailErr }" placeholder="Adres e-mail" type="text" name="email" v-model="data.email">
                </div>

                <div>
                    <label for="password">Hasło:</label>
                    <input :class="{ 'input-error': error.passwordErr }" placeholder="Hasło" type="password" name="password" v-model="data.password">
                </div>

                <button type="submit">Zaloguj się</button>
            </form>

            <div id="register">
                <p>Nie masz konta?</p>
                <Nuxt-link to="/firma/rejestracja">Zarejestruj swoją firmę</Nuxt-link>
            </div>

            <p id="for-users">
                <Nuxt-link to="/logowanie">Logowanie dla użytkowników</Nuxt-link>
            </p>
        </div>
    </div>
</template>

<script setup>
    definePageMeta({
        layout: 'clear',
    });

    const data = ref({
        email: '',
        password: ''
    });

    const error = ref({
       emailErr: false,
       passwordErr: false 
    });

    const error_message = ref('');
    const success = ref(false);
    const email = useRoute().query.email;
    
    if(email !== undefined) {
        data.value.email = email;
    }

    async function Login() {
        if(!data.value.email) {
            error.value.emailErr = true;
            success.value = false;
            error_message.value = 'Uzupełnij wymagane pola!';
        } else {
            error.value.emailErr = false;
            success.value = true;
            error_message.value = '';
        }

        if(!data.value.password) {
            error.value.passwordErr = true;
            success.value = false;
            error_message.value = 'Uzupełnij wymagane pola!';
        } else {
            error.value.passwordErr = false;
            success.value = true;
            error_message.value = '';
        }

        if(success.value === true) {
            const response = await $fetch('http://localhost/advertising-system/backend/api/company/LogInCompany.php', { body: data.value, method: 'post', credentials: 'include', responseType: 'json' });

            if(response) {
                if(response == 'success') {
                    error_message.value = '';

                    navigateTo('/firma/profil');
                } else {
                    error_message.value = 'Nie znaleziono firmy o takich danych!';
                }
            }
        }
    }
</script>


<style scoped>
    .error{
        font-size: 16px;
        color: #FA4132;
        padding-bottom: 30px;
        text-align: center;
    }

    .input-error {
        border-color: #FA4132;
    }

    input {
        border: 1px solid var(--asc-bg-border)
    }

    #root{
        width: 100%;
        height: 100vh;
    }

    #blur-circle{
        background: rgba(98, 68, 219, 0.06);
        width: 1126px;
        height: 1125px;
        filter: blur(150px);
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        border-radius: 50%;
        z-index: -9999;
    }

    #login-box{
        background-color: #FFF;
        padding: 50px 100px 0;
        width: 400px;
        min-height: 550px;
        position: absolute;
        top: 30%;
        left: 50%;
        transform: translate(-50%, -30%);
        box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.15);
        border-radius: 2px;
        z-index: 99;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    #login-box h2{
        font-size: 26px;
        text-align: center;
    }

    #login-box p{
        text-align: center;
        margin: 10px 0 50px;
    }

    #register{
        flex: 1;
        display: flex;
        gap: 10px;
        align-items: start;
    }

    #register p, #register a {
        margin: 20px 0 0 !important;
        display: block;
    }

    #register a {
        color: rgb(16, 125, 214);
    }

    #login-box form {
        display: flex;
        flex-direction: column;
        gap: 20px
    }

    #login-box form div{
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    #login-box form div label{
        font-size: 20px;
    }

    #login-box form div input{
        padding: 15px;
        height: 50px;
        box-sizing: border-box;
    }

    #login-box button{
        margin-top: 10px;
        width: 400px;
        background-color: #6244DB;
        color: #fff;
        padding: 15px;
        font-size: 18px;
        cursor: pointer;
    }

    #login-box p#for-users{
        text-align: center;
        margin: 40px 0 20px 0;
    }
    
    #login-box p#for-users a{
        text-decoration: none;
        color: #6244DB;
    }
</style>