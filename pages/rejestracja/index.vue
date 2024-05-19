<template>
    <Transition>
        <div v-if="status == 'failure'" id="email-exists">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                <path d="M256 32c14.2 0 27.3 7.5 34.5 19.8l216 368c7.3 12.4 7.3 27.7 .2 40.1S486.3 480 472 480H40c-14.3 0-27.6-7.7-34.7-20.1s-7-27.8 .2-40.1l216-368C228.7 39.5 241.8 32 256 32zm0 128c-13.3 0-24 10.7-24 24V296c0 13.3 10.7 24 24 24s24-10.7 24-24V184c0-13.3-10.7-24-24-24zm32 224a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z"/>
            </svg>

            <h2>
                {{ message }},
                <a @click.prevent="GoToLogin(data.email)">przejdź do logowania</a>
            </h2>
        </div>
    </Transition>

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
                    <input :class="{ 'input-error': error.passwordErr }" placeholder="Hasło" type="password" name="password" v-model="data.password">
                    <span class="error">{{ error.passwordErr }}</span>
                </div>

                <div>
                    <label for="password_2">Powtórz hasło:</label>
                    <input :class="{ 'input-error': error.password_2Err }" placeholder="Powtórz hasło" type="password" name="password_2" v-model="data.password_2">
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
        layout: 'clear',
    });

    const data = ref({
        login: '',
        email: '',
        password: '',
        password_2: ''
    });

    const error = ref({
        emailErr: '',
        passwordErr: '',
        password_2Err: ''
    });

    const success = ref(false);

    const status = ref('');
    const message = ref('');

    function GoToLogin(email) {
        const router = useRouter();

        router.push({ path: '/logowanie', query: { email: data.value.email } });
    }

    async function Register() {
        if(data.value.email == '') {
            error.value.emailErr = 'Wypełnij pole!';
            success.value = false;
        } else {
            error.value.emailErr = '';
            success.value = true;

            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if(!regex.test(data.value.email)) {
                error.value.emailErr = 'Niepoprawny adres e-mail';
                success.value = false;
            } else {
                error.value.emailErr = '';
                success.value = true;
            }
        }

        if(data.value.password == '') {
            error.value.passwordErr = 'Wypełnij pole!';
            success.value = false;
        } else {
            error.value.passwordErr = '';
            success.value = true;
        }

        if(data.value.password_2 == '') {
            error.value.password_2Err = 'Wypełnij pole!';
            success.value = false;
        } else {
            error.value.password_2Err = '';
            success.value = true;
        }

        if(success.value === true) {
            const response = await $fetch('http://localhost/advertising-system/backend/api/user/RegisterUser.php' , { body: data.value, method: 'post', responseType: 'json' });

            if(response) {
                console.log(response);

                status.value = response.status;
                message.value = response.message;
            }
        }
    }
</script>

<style scoped>
    #email-exists {
        position: absolute;
        left: calc(50% - 270px);
        padding: 20px;
        top: 20px;
        width: 500px;
        background-color: var(--asc-bg-alt);
        box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.15);
        display: flex; 
        gap: 20px;
        border-radius: 2px;
        z-index: 9999;
    }

    #email-exists svg {
        fill: #ffcc00;
        width: 50px;
    }

    #email-exists h2 {
        font-size: 15px;
    }

    #email-exists h2 a {
        color: rgb(16, 125, 214);
        cursor: pointer;
    }

    .error{
        font-size: 14px;
        color: #FA4132;
        padding-bottom: 10px;
        text-align: right;
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

    .v-enter-active,
    .v-leave-active {
        transition: all .3s cubic-bezier(0.83,0.04,0.17,1.28);
    }

    .v-enter-from,
    .v-leave-to {
        transform: translateY(-50px);
        opacity: 0;
    }
</style>