<template>
    <EditModal @close="isModalVisible = false" :isVisible="isModalVisible" >
        <EditImage v-if="modalType === 0" />
        <EditDescription v-if="modalType === 1" :description="userData.opis" />
        <EditSkills v-if="modalType === 2" :skills="userSkills" />
        <EditExperience v-if="modalType === 3" />
    </EditModal>

    <div id="main-flex">
        <section id="user-top">
            <div id="user-main">
                <div id="image">
                    <div id="img" @click="isModalVisible = true; modalType = 0">
                        <div id="upload-image">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                <path d="M288 109.3V352c0 17.7-14.3 32-32 32s-32-14.3-32-32V109.3l-73.4 73.4c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l128-128c12.5-12.5 32.8-12.5 45.3 0l128 128c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L288 109.3zM64 352H192c0 35.3 28.7 64 64 64s64-28.7 64-64H448c35.3 0 64 28.7 64 64v32c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V416c0-35.3 28.7-64 64-64zM432 456a24 24 0 1 0 0-48 24 24 0 1 0 0 48z"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <div id="user-basic-info">
                    <div>
                        <h2 id="user-name">{{ userData.imie }} {{ userData.nazwisko }}</h2>
                        <h3 id="user-position">{{ userData.stanowisko }}</h3>
                    </div>

                    <PurpleButton style="margin-bottom: 10px;">Udostępnij profil</PurpleButton>
                </div>
            </div>

            <div id="user-alt">
                <div>
                    <h4>Kraj: </h4>
                    <h4>{{ userData.kraj }}</h4>
                </div>

                <div>
                    <h4>Wiek: </h4>
                    <h4>{{ userData.wiek }}</h4>
                </div>

                <div>
                    <h4>Numer kontaktowy: </h4>
                    <h4>{{ userData.numer_telefonu }}</h4>
                </div>

                <div>
                    <h4>Status: </h4>
                    <h4>{{ userData.status }}</h4>
                </div>
            </div>
        </section>

        <section id="main-section">
            <div>
                <EditHeader @edit="isModalVisible = true; modalType = 1">Podsumowanie zawodowe</EditHeader>
                <hr>
                <p>{{ userData.opis }}</p>
            </div>

            <div>
                <EditHeader @edit="isModalVisible = true; modalType = 2">Umiejętności</EditHeader>
                <hr>

                <div id="skills">
                    <UserSkill v-for="skill in userSkills" :skill="skill.umiejetnosc" />
                </div>
            </div>

            <div>
                <EditHeader @edit="isModalVisible = true; modalType = 3">Doświadczenie</EditHeader>
                <hr>

                <div id="experience">
                    <div id="experience-block" v-for="experience in userExperience">
                        <div id="abstract">
                            <div id="circle"></div>
                            <div id="line"></div>
                        </div>

                        <UserExperience :experience="experience"/>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <section id="right-side">
        <div id="languages">
            <EditHeader style="font-size: 20px;">Języki</EditHeader>
            <hr>

            <div v-for="language in languages">
                <h4>{{ language.lang }}</h4>
                <h4>{{ language.level }}</h4>
            </div>
        </div>
    </section>
</template>

<script setup>
    const { data: userData } = await useFetch('http://localhost/advertising-system/backend/api/user/GetUserData.php', { credentials: 'include', responseType: 'json', method: 'post' });
    const { data: userSkills } = await useFetch('http://localhost/advertising-system/backend/api/user/GetUserSkills.php', { credentials: 'include', responseType: 'json', method: 'post' });
    const { data: userExperience } = await useFetch('http://localhost/advertising-system/backend/api/user/GetUserExperience.php', { credentials: 'include', responseType: 'json', method: 'post' });

    // --------
    // data

    const languages = ref([
        { lang: 'Polski', level: 'Ojczysty' },
        { lang: 'Angielski', level: 'Zaawansowany' },
        { lang: 'Niemiecki', level: 'Komunikatywny' }
    ]);

    const isModalVisible = ref(false);
    const modalType = ref(0);
</script>

<style scoped>
    #main-flex {
        display: flex;
        flex-direction: column;
        width: calc(100% - 300px);
    }

    main #user-top {
        background-color: #FFF;
        width: 100%;
        height: 250px;
        display: flex;
        align-items: center;
        border-bottom: 1px solid #DDD;
    }

    #user-main {
        display: flex;
        flex: 1;
        border-right: 1px solid #DDD;
    }

    #user-alt {
        width: 300px;
        height: 150px;
        padding: 13px 40px 0 20px;
        gap: 10px;
        display: flex;
        flex-direction: column;
    }

    #user-alt > div {
        display: flex;
        justify-content: space-between;
    }

    #user-alt > div h4:first-child {
        color: var(--asc-txt-ui-sec);
        font-weight: 600;
    }

    #user-main #image {
        width: 220px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #user-basic-info {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 150px;
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
        font-weight: 700;
        color: var(--asc-txt-sec);
        padding-top: 13px;
        font-size: 25px;
    }

    h3#user-position {
        color: var(--asc-txt);
        font-size: 15px;
        padding-top: 6px;
        font-weight: 600;
    }

    section#main-section {
        width: 100%;
        background-color: #FFF;
    }

    hr {
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

    #languages > div {
        display: flex;
        justify-content: space-between;
        padding: 10px 13px
    }
</style>