<template>
    <div id="root">
        <div id="blur-circle"></div>
        <div id="login-box">
            <h2>Zaloguj się</h2>

            <form @submit.prevent="Login" method="post"> 
                <div>
                    <label for="email">Email:</label>
                    <input :class="{ 'input-error': error.emailErr }" placeholder="Adres e-mail" type="text" name="email" v-model="data.email">
                    <span class="error">{{ error.emailErr }}</span>
                </div>

                <div>
                    <label for="password">Hasło:</label>
                    <input :class="{ 'input-error': error.passwordErr }" placeholder="Hasło" type="password" name="password" v-model="data.password">
                    <span class="error">{{ error.passwordErr }}</span>
                </div>

                <button type="submit">Dalej</button>
            </form>

            <p id="for-companies">
                <Nuxt-link to="/firma/logowanie">Logowanie dla firm</Nuxt-link>
            </p>
        </div>
    </div>
</template>

<script setup>
    definePageMeta({
        layout: 'login'
    });

    const data = ref({
        email: '',
        password: ''
    });

    const error = ref({
       emailErr: '',
       passwordErr: '' 
    });

    function Login() {
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
    }

    #login-box h2{
        font-size: 26px;
        text-align: center;
    }

    #login-box p{
        text-align: center;
        margin: 10px 0 50px;
    }

    #login-box form {
        flex: 1;
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

    #login-box p#for-companies{
        text-align: center;
        margin: 40px 0 20px 0;
    }
    
    #login-box p#for-companies a{
        text-decoration: none;
        color: #6244DB;
    }


    .v-enter-active,
    .v-leave-active {
        opacity: 1;
        transition: all 0.5s cubic-bezier(0.7,0.03,0.12,1);
    }

    .v-enter-from,
    .v-leave-to {
        transform: translateX(100px);
        opacity: 0;
    }

</style>