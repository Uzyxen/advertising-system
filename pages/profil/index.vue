<template>
    <div id="root">
        <div id="background-baner"></div>
        <div id="root-inner">
            <nav id="top-nav">
                <ul>
                    <li class="current">Profil</li>
                    <li>CV</li>
                </ul>
            </nav>

            <main>
                <section id="left-side">
                    <div id="user-main">
                        <div id="image">
                            <div id="img">
                                <div id="upload-image">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                        <path d="M288 109.3V352c0 17.7-14.3 32-32 32s-32-14.3-32-32V109.3l-73.4 73.4c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l128-128c12.5-12.5 32.8-12.5 45.3 0l128 128c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L288 109.3zM64 352H192c0 35.3 28.7 64 64 64s64-28.7 64-64H448c35.3 0 64 28.7 64 64v32c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V416c0-35.3 28.7-64 64-64zM432 456a24 24 0 1 0 0-48 24 24 0 1 0 0 48z"/>
                                    </svg>
                                </div>
                            </div>
                        </div>
                        <h2 id="user-name">{{ userData.imie }} {{ userData.nazwisko }}</h2>
                        <h3 id="user-position">{{ userData.stanowisko }}</h3>
                    </div>
                </section>

                <section id="main-section">
                    <div>
                        <EditHeader>Podsumowanie zawodowe</EditHeader>
                        <hr>
                        <p>{{ userData.opis }}</p>
                    </div>

                    <div>
                        <EditHeader>Umiejętności</EditHeader>
                        <hr>

                        <div id="skills">
                            <UserSkill v-for="skill in userSkills" :skill="skill.umiejetnosc" />
                        </div>
                    </div>

                    <div>
                        <EditHeader>Doświadczenie</EditHeader>
                        <hr>

                        <div id="experience">
                            <div id="experience-block">
                                <div id="abstract">
                                    <div id="circle"></div>
                                    <div id="line"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="right-side">

                </section>
            </main>
        </div>
    </div>
</template>

<script setup>
import UserSkill from '~/components/UserSkill.vue';

    definePageMeta({
        middleware: 'auth-user'
    });

    const { data: userData } = await useFetch('http://localhost/advertising-system/backend/api/user/GetUserData.php', { credentials: 'include', responseType: 'json', method: 'post' });
    const { data: userSkills } = await useFetch('http://localhost/advertising-system/backend/api/user/GetUserSkills.php', { credentials: 'include', responseType: 'json', method: 'post' });

</script>

<style scoped>
    #root{  
        min-height: 100vh;
    }

    #background-baner {
        width: 100%;
        height: 300px;
        background-color: #6244DB;
        position: absolute;
        left: 0;
        top: 0;
        z-index: -1;
    }

    #root-inner {
        padding: 40px 150px 50px;
        display: flex;
        flex-direction: column;
        gap: 22px;
    }

    nav#top-nav {
        width: 100%;
        height: 50px;
        background-color: #FFF;
        box-shadow: 0 0 5px rgba(0,0,0,.12);
    }

    #top-nav ul {
        margin: 0;
        padding: 0;
        list-style-type: none;
        display: flex;
        height: 100%;
        width: 30%;
    }

    #top-nav ul li{
        color: #676071;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-weight: 600;
        flex: 1;
        cursor: pointer;
    }

    #top-nav ul li.current{
        color: #6244DB;
    }

    main {
        display: flex;
        gap: 22px
    }

    main #left-side {
        background-color: #FFF;
        width: 300px;
        display: flex;
        flex-direction: column;
    }

    #left-side #user-main {
        display: flex;
        flex-direction: column;
        height: 300px;
        border-bottom: 1px solid #DDD;
    }

    #user-main #image {
        width: 300px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding-top: 40px;
    }

    #user-main #image #img {
        background-image: url('/src/assets/example-pp.jpg');
        width: 150px;
        height: 150px;
        background-size: cover;
        border-radius: 50%;
    }

    #img {
        border: 1px solid #DDD;
        cursor: pointer;
    }

    #img #upload-image {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #fff;
        width: 100%;
        height: 100%;
        border-radius: 50%;
        opacity: 0;
        transition: opacity .3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    #img:hover #upload-image {
        opacity: 1;
    }

    #upload-image svg {
        width: 30%;
        fill: #ddd;
        
    }

    h2#user-name {
        text-align: center;
        font-weight: 700;
        color: #231D2B;
        padding-top: 13px;
        font-size: 25px;
    }

    h3#user-position {
        text-align: center;
        color: #6244DB;
        font-size: 15px;
        padding-top: 6px;
        font-weight: 700;
    }

    section#main-section {
        width: calc(100% - 650px);
        background-color: #FFF;
        border-left: 1px solid #DDD;
        border-right: 1px solid #DDD;
    }

    #main-section > div h2 {
        color: #231D2B;
        font-size: 25px;
        margin: 22px 0 13px 22px;
    }

    #main-section > div hr {
        background-color: #DDD;
        height: 1px;
        border: none;
        margin: 0;
    }
    
    #main-section > div p {
        color: #676071;
        font-size: 15px;
        padding: 22px 22px 13px;
        line-height: 150%;
        margin: 0;
    }

    #main-section > div #skills {
        display: flex;
        gap: 13px;
        padding: 22px 22px 13px;
        flex-wrap: wrap;
    }

    section#right-side {
        width: 350px;
        background-color: #FFF;
    }

    #experience {
        display: flex;
        flex-direction: column;
        padding: 22px 22px 13px;
    }

    #experience > div#experience-block {
        display: flex;
        gap: 20px;
    }

    #experience div#experience-block > #abstract {
        width: 25px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    #experience #circle {
        border: 3px solid #6244DB;
        height: 19px;
        width: 19px;
        border-radius: 50%;
    }

    #experience #line {
        height: 250px;
        width: 3px;
        background-color: #6244DB;
    }

    @media (min-width: 1920px){
        #root{
            max-width: 1740px;
            margin: 0 auto;
        }
    }

    
    #dark-block {
        position: fixed;
        background-color: #0000008a;
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        z-index: 999;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #edit-modal {
        position: fixed;
        background-color: #FFF;
        box-shadow: 0 0 5px rgba(0,0,0,.12);
        width: 500px;
        max-height: 500px;
        place-self: center;
        padding: 35px;
        z-index: 999;
        display: flex;
        flex-direction: column;
        gap: 20px;
        border-radius: 2px;
        user-select: none;
    }

    #edit-modal svg {
        position: absolute;
        left: 20px;
        top: 20px;
        width: 25px;
        height: 25px;
        fill: #6244DB;
        cursor: pointer;
        transition: fill .3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    #edit-modal svg:hover {
        fill: #F44534;
    }

    #modal-content .content {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .content h2 {
        text-align: center;
        color: #231D2B;
    }

    .content textarea {
        resize: none;
        outline: none;
        border: 1px solid #DDD;
        height: 300px;
        font-size: 15px;
    }

    .content #skills {
        display: flex;
        flex-direction: column;
        gap: 12px;
        overflow-y: auto;
        height: 400px;
    }

    #add-skill {
        display: flex;
        gap: 12px;
    }

    #add-skill input {
        flex: 1;
        border: 1px solid #DDD;
        outline: none;
        padding-left: 5px;
    }

    #add-skill button {
        width: 150px;
        padding: 12px 15px;
        cursor: pointer;
        font-size: 15px;
        background-color: #6244DB;
        color: #FFF;
    }

    #edit-modal button#save {
        background-color: #6244DB;
        color: #FFF;
        font-size: 20px;
        padding: 12px 0;
        cursor: pointer;
    }

    .v-enter-active,
    .v-leave-active {
        transition: all .3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    .v-enter-from,
    .v-leave-to {
        transform: scale(.8);
        opacity: 0;
        transform-origin: center;
    }

</style>