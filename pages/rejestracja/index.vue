<template>
    <div id="root">
        <div id="blur-circle"></div>

        <div id="register-box">
            <h2>Zarejestruj się</h2>

            <form @submit.prevent="Register" method="post">
                <div>
                    <label for="email">Email:</label>
                    <input :class="{ 'input-error': error.emailErr }" placeholder="Adres e-mail" type="text" name="email" v-model="data.email">
                    <span class="error">{{ error.emailErr }}</span>
                </div>

                <div>
                    <label for="password">Hasło:</label>
                    <input :class="{ 'input-error': error.passwordErr }" placeholder="Hasło" type="text" name="password" v-model="data.password">
                    <span class="error">{{ error.passwordErr }}</span>
                </div>

                <div>
                    <label for="password_2">Powtórz hasło:</label>
                    <input :class="{ 'input-error': error.password_2Err }" placeholder="Powtórz hasło" type="text" name="password_2" v-model="data.password_2">
                    <span class="error">{{ error.password_2Err }}</span>
                </div>

                <button type="submit">Zarejestruj się</button>
            </form>

            <div id="login">
                <p>Masz już konto?</p>
                <Nuxt-link to="/logowanie">Zaloguj się</Nuxt-link>
            </div>
        </div>
    </div>
</template>

<script setup>
    definePageMeta({
        layout: 'clear'
    });

    const data = ref({
        login: '',
        email: '',
        password: '',
        password_2: ''
    });

    const error = ref({
        loginErr: '',
        emailErr: '',
        passwordErr: '',
        password_2Err: ''
    });

    function Register() {
        if(data.value.email == '') {
            error.value.emailErr = 'Wypełnij pole!';
        } else {
            error.value.emailErr = '';
        }

        if(data.value.password == '') {
            error.value.passwordErr = 'Wypełnij pole!';
        } else {
            error.value.passwordErr = '';
        }

        if(data.value.password_2 == '') {
            error.value.password_2Err = 'Wypełnij pole!';
        } else {
            error.value.password_2Err = '';
        }
    }
</script>

<style scoped>
    .error{
        font-size: 14px;
        color: #FA4132;
        padding-bottom: 10px;
    }

    .input-error {
        border-color: #FA4132;
    }

   #root {
        height: 100vh;
    }

    input {
        border: 1px solid var(--asc-bg-border);
    }

    #register-box{
        padding: 50px 100px 0;
        width: 400px;
        height: 590px;
        position: absolute;
        top: 30%;
        left: 50%;
        transform: translate(-50%, -30%);
        box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.15);
        border-radius: 2px;
        background-color: #FFF;
    }

    #register-box form div {
        display: flex;
        flex-direction: column;
        gap: 10px;
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

    #register-box h2{
        font-size: 26px;
        text-align: center;
    }

    #register-box p{
        text-align: center;
        margin: 10px 0 50px;
    }

    #register-box {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    #register-box label{
        font-size: 20px;
    }

    #register-box input{
        padding: 15px;
        height: 50px;
        box-sizing: border-box;
    }

    #register-box button[type='submit']{
        margin-top: 10px;
        width: 400px;
        background-color: #6244DB;
        color: #fff;
        padding: 15px;
        font-size: 18px;
        cursor: pointer;
    }

    #login{
        flex: 1;
        display: flex;
        gap: 10px;
        align-items: start;
    }

    #login p, #login a {
        margin: 20px 0 0 !important;
    }

    #login a {
        color: rgb(16, 125, 214);
    }
</style>