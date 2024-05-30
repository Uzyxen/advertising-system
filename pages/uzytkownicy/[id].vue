<template>
    <div id="root" v-if="userData && userData !== 'private'">
        <SectionTitle style="margin-bottom: 30px">Profil użytkownika {{ userData.imie }} {{ userData.nazwisko}}</SectionTitle>

        <main>
            <div id="main-flex">
                <section id="user-top">
                    <div id="user-main">
                        <div id="image">
                            <div id="img">
                                <div id="upload-image"></div>
                            </div>
                        </div>

                        <div id="user-basic-info">
                            <div>
                                <h2 id="user-name">{{ userData.imie }} {{ userData.nazwisko }}</h2>
                                <h3 id="user-position">{{ userData.stanowisko }}</h3>
                            </div>

                            <PurpleButton style="margin-bottom: 10px; width: fit-content;">Napisz wiadomość</PurpleButton>
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
        </main>
    </div>

    <div v-if="userData === false">
        <Page404 />
    </div>

    <LockedPage v-if="userData === 'private'">
        Ten profil jest prywatny
    </LockedPage>
</template>

<script setup>

    const route = useRoute();
    const { data: userData } = await useFetch('http://localhost/advertising-system/backend/api/users/GetUser.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'id': route.params.id } });

    //const { data: userSkills } = await useFetch('http://localhost/advertising-system/backend/api/users/GetUserSkills.php', { credentials: 'include', responseType: 'json', method: 'post' });
    //const { data: userExperience } = await useFetch('http://localhost/advertising-system/backend/api/users/GetUserExperience.php', { credentials: 'include', responseType: 'json', method: 'post' });

    // --------
    // data

    const languages = ref([
        { lang: 'Polski', level: 'Ojczysty' },
        { lang: 'Angielski', level: 'Zaawansowany' },
        { lang: 'Niemiecki', level: 'Komunikatywny' }
    ]);
</script>

<style scoped>
    #root {
        padding: 20px 150px 0;
    }

    main {
        display: flex;
    }

    #main-flex {
        display: flex;
        flex-direction: column;
        width: calc(100% - 300px);
        border-right: 1px solid #DDD;
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