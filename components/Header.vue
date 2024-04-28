<template>
    <header>
        <div id="topbar">
            <Nuxt-link id="logo" to="/">moltaro.pl</Nuxt-link>
            <nav>
                <Nuxt-link to="/oferty">
                    Oferty pracy
                </Nuxt-link>

                <Nuxt-link to="/oferty-uzytkownikow" v-if="user_logged">
                    Szukaj pracowników
                </Nuxt-link>

                <Nuxt-link to="/cv">Kreator CV</Nuxt-link>
            </nav>

            <div id="hamburger-menu">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                    <path d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM64 256c0-17.7 14.3-32 32-32H480c17.7 0 32 14.3 32 32s-14.3 32-32 32H96c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z"/>
                </svg>
            </div>

            <div id="my-account">
                <div id="my-acc" @click.stop="account_dropdown_visible = !account_dropdown_visible">
                    Moje konto
                </div>

                <div id="my-account-dropdown" v-if="account_dropdown_visible" ref="dropDown">
                    <div id="dropdown-company-logged" v-if="company_logged">
                        <ul>
                            <li>
                                <Nuxt-link to="/firma/profil">Profil firmy</Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/powiadomienia" id="notifications">
                                    <span>Powiadomienia</span>

                                    <p v-if="notifications_counter > 0">{{ notifications_counter }}</p>
                                </Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/wiadomosci" id="messages">
                                    <span>Wiadomości</span>

                                    <p v-if="messages_counter > 0">{{ messages_counter }}</p>
                                </Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/firma/ogloszenia">Ogłoszenia firmy</Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/ustawienia">Ustawienia</Nuxt-link>
                            </li>
                        </ul>

                        <hr>

                        <button class="logout-button" @click="LogOut">Wyloguj się</button>
                    </div>

                    <div id="dropdown-user-logged" v-if="user_logged">
                        <ul>
                            <li><Nuxt-link to="/profil">Profil</Nuxt-link></li>

                            <li>
                                <Nuxt-link to="/powiadomienia" id="notifications">
                                    <span>Powiadomienia</span>

                                    <p v-if="notifications_counter > 0">{{ notifications_counter }}</p>
                                </Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/wiadomosci" id="messages">
                                    <span>Wiadomości</span>

                                    <p v-if="messages_counter > 0">{{ messages_counter }}</p>
                                </Nuxt-link>
                            </li>

                            <li><Nuxt-link to="/ustawienia">Ustawienia</Nuxt-link></li>
                        </ul>

                        <hr>

                        <button class="logout-button" @click="LogOut">Wyloguj się</button>
                    </div>

                    <div v-if="user_logged === false && company_logged === false">
                        <h2>Zaloguj się, aby uzyskać dostęp do wszystkich funkcji portalu</h2>
                        <Nuxt-link to="/logowanie"><button id="login-button">Zaloguj się</button></Nuxt-link>
                        <h3>Lub</h3>
                        <Nuxt-link to="/rejestracja"><button id="register-button">Zarejestruj się</button></Nuxt-link>
                    </div>
                </div>
            </div>
        </div>
    </header>
</template>

<script setup>
    const user_logged = ref(false);
    const company_logged = ref(false);
    const account_dropdown_visible = ref(false);

    async function LogOut() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/user/LogOut.php', { method: 'post', credentials: 'include', responseType: 'json' });

        console.log(response);
    }

    async function CheckIfLogged() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/user/CheckIfLogged.php', { credentials: 'include', responseType: 'json' });

        if(response) {
            user_logged.value = response.logged;
        }
    }

    onMounted(() => {
        CheckIfLogged();
    });
</script>

<style scoped>
    header{
        box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.15);
        z-index: 999;
        position: relative;
        background-color: var(--asc-bg-alt);
    }

    #topbar{
        height: 60px;
        padding: 0 150px;
        display: flex;
        align-items: center;
    }   

    #topbar a{
        text-decoration: none;
    }

    nav{
        flex: 1;
    }

    a#logo{
        color: var(--asc-txt);
        font-size: 35px;
        font-weight: 700;
    }

    nav a{
        padding: 0 0 0 60px;
        color: var(--asc-txt-ui);
        font-weight: 700;
        font-size: 15px;
    }

    #my-account{
        background-color: var(--asc-bg);
        border-radius: 2px;
        color: var(--asc-txt-alt);
        width: 160px;
        height: 40px;
    }

    #hamburger-menu {
        display: none;
    }

    #my-acc{
        cursor: pointer;
        width: 100%;
        height: 100%;
        border-radius: 2px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #my-account-dropdown{
        position: absolute;
        min-width: 200px;
        top: 58px;
        right: 150px;
        background-color: var(--asc-bg-alt);
        border: 1px solid var(--asc-bg-border);
        border-radius: 4px;
        padding: 10px 15px;
    }

    #my-account-dropdown p{
        color: var(--asc-txt-ui-alt);
    }

    #my-account-dropdown p > span{
        font-weight: 700;
    }

    #my-account-dropdown > div{
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 300px;
    }

    #my-account-dropdown > div h2{
        color: var(--asc-txt-ui-alt);
        font-size: 15px;
        margin: 10px 0 15px;
        width: 280px;
    }

    #my-account-dropdown > div button{
        cursor: pointer;
        font-size: 18px;
        padding: 10px;
        width: 280px;
        height: 45px;
        border-radius: 3px;
    }

    #dropdown-user-logged, #dropdown-company-logged{
        width: 240px !important;
    }

    #dropdown-user-logged button, #dropdown-company-logged button{
        width: 240px !important;
        border: 3px solid var(--asc-bg-border-alt);
        color: var(--asc-txt);
    }

    #dropdown-user-logged ul, #dropdown-company-logged ul{
        width: 100%;
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    #dropdown-user-logged ul li a, #dropdown-company-logged ul li a{
        width: calc(100% - 20px);
        height: 100%;
        display: block;
        cursor: pointer;
        color: var(--asc-txt-ui-alt);
        padding: 15px 10px 15px 10px;
        display: flex;
        justify-content: left;
        align-items: center;
        position: relative;
        z-index: 1;
        transition: color .2s ease-in-out;
    }

    #dropdown-user-logged ul li a::before, #dropdown-company-logged ul li a::before{
        content: '';
        position: absolute;
        width: 3px;
        height: 100%;
        left: 0;
        top: 0;
        background-color: var(--asc-bg);
        z-index: -1;
        transition: width .2s ease-in-out;
    }

    #dropdown-user-logged ul li a:hover, #dropdown-company-logged ul li a:hover{
        color: var(--asc-txt-hover);
    }

    #dropdown-user-logged ul li a:hover::before, #dropdown-company-logged ul li a:hover::before{
        width: 100%;
    }

    #notifications p, #messages p{
        border-radius: 2px;
        position: absolute;
        right: 5px;
        background-color: #FF5252;
        padding: 5px;
        height: 15px;
        width: 15px;
        display: flex;
        justify-content: center;
        align-items: center;
        color: var(--asc-txt-alt);
        margin: 0;
    }

    #login-button{
        background-color: var(--asc-bg);
        color: var(--asc-txt-alt);
    }

    #register-button{
        border: 3px solid var(--asc-bg-border-alt);
        color: var(--asc-txt);
        margin-bottom: 10px;
        background-color: transparent;
    }

    #my-account-dropdown > div h3{
        color: var(--asc-txt-ui-alt);
        font-size: 18px;
        margin: 10px 0;
    }

    hr{
        margin-top: 30px;
        border: none;
        height: 1px;
        background-color: var(--asc-bg-border);
        width: 100%;
    }

    .logout-button{
        background-color: #FFF;
        border: none !important;
        color: #FF5252 !important;
        height: 30px !important;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    @media (min-width: 1920px){
        #topbar{
            max-width: 1440px;
            margin: 0 auto;
        }
    }

    @media (max-width: 1300px) {
        #topbar {
            padding: 0 60px;
        }
    }

    @media (max-width: 1015px) {
        #topbar {
            padding: 0 20px;
        }
    }

    @media (max-width: 896px) {
        #my-account, #topbar > nav {
            display: none;
        }

        #topbar #logo {
            flex: 1;
        }

        #hamburger-menu {
            display: block;
            width: 35px;
            height: 35px;
            cursor: pointer;
            fill: #231d2b;
            opacity: .8;
        }
    }
    
</style>