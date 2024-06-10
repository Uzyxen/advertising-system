<template>
    <ModalBlock @close="isModalVisible = false" :isVisible="isModalVisible">
        <EditImage v-if="modalType === 0" :is-company="false" />
        <EditDescription v-if="modalType === 1" :is-company="false" :description="userData.opis" @saved="(value) => { userData.opis = value; isModalVisible = false}">
            Podsumowanie zawodowe
        </EditDescription>
        <EditSkills v-if="modalType === 2" :skills="userSkills" @added="(value) => { userSkills.push({ skill: value }) }" />
        <EditExperience v-if="modalType === 3" :experience="userExperience" />
    </ModalBlock>

    <Transition>
        <div id="unsaved" v-if="unsaved">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                <path d="M256 32c14.2 0 27.3 7.5 34.5 19.8l216 368c7.3 12.4 7.3 27.7 .2 40.1S486.3 480 472 480H40c-14.3 0-27.6-7.7-34.7-20.1s-7-27.8 .2-40.1l216-368C228.7 39.5 241.8 32 256 32zm0 128c-13.3 0-24 10.7-24 24V296c0 13.3 10.7 24 24 24s24-10.7 24-24V184c0-13.3-10.7-24-24-24zm32 224a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z"/>
            </svg>

            <h2>
                Masz niezapisane zmiany!
            </h2>

            <PurpleButton @button-clicked="saveChanges">Zapisz</PurpleButton>
        </div>
    </Transition>

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

                        <div v-if="userData.image_url">
                            <img :src="'/user/' + userData.image_url" alt="Zdjęcie profilowe użytkownika">
                        </div>
                    </div>
                </div>

                <div id="user-basic-info">
                    <div>
                        <h2 id="user-name">
                            <span class="required">
                                <input spellcheck="false" type="text" placeholder="Imię: " @input="inputChanged" class="user-input" v-model="newUserData.firstName">
                            </span>
                            <span class="required">
                                <input spellcheck="false" type="text" placeholder="Nazwisko: " @input="inputChanged" class="user-input" v-model="newUserData.lastName">
                            </span>
                        </h2>
                        <h3 id="user-position">
                            <span class="required">
                                <input spellcheck="false" type="text" placeholder="Stanowisko: " @input="inputChanged" class="user-input required" v-model="newUserData.position">
                            </span>
                        </h3>
                    </div>

                    <PurpleButton id="share"style="margin-bottom: 10px;">Udostępnij profil</PurpleButton>
                </div>
            </div>

            <div id="user-alt">
                <div>
                    <h4>Kraj: </h4>
                    <input type="text" placeholder="Kraj: " class="user-input-mini" @input="inputChanged" v-model="newUserData.country">
                </div>

                <div>
                    <h4>Wiek: </h4>
                    <input type="text" placeholder="Wiek: " class="user-input-mini" @input="inputChanged" v-model="newUserData.age">
                </div>

                <div>
                    <h4>Numer kontaktowy: </h4>
                    <span class="required">
                        <input maxlength="11" type="text" placeholder="Numer kontaktowy: " class="user-input-mini" @input="inputChanged(); formatPhoneNumber()" v-model="newUserData.phoneNumber">
                    </span>
                </div>

                <div>
                    <h4>Status: </h4>
                    <h4>{{ userData.status }}</h4>
                </div>
            </div>
        </section>

        <section id="main-section">
            <div>
                <EditHeader :is-edit-mode="true" @edit="isModalVisible = true; modalType = 1">Podsumowanie zawodowe</EditHeader>
                <hr>
                <p>{{ userData.opis }}</p>
            </div>

            <div>
                <EditHeader :is-edit-mode="true" @edit="isModalVisible = true; modalType = 2">Umiejętności</EditHeader>
                <hr>

                <div id="skills">
                    <UserSkill v-for="skill in userSkills" :skill="skill.skill" />
                </div>
            </div>

            <div>
                <EditHeader :is-edit-mode="true" @edit="isEditMode = true">Doświadczenie</EditHeader>
                <hr>

                <UserExperience />
            </div>
        </section>
    </div>

    <section id="right-side">
        <div id="languages">
            <EditHeader :is-edit-mode="true" style="font-size: 20px;">Języki</EditHeader>
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
    // --------
    // data

    const newUserData = ref({
        firstName: userData.value.imie,
        lastName: userData.value.nazwisko,
        position: userData.value.stanowisko,
        country: userData.value.kraj,
        age: userData.value.wiek,
        phoneNumber: userData.value.numer_telefonu
    });

    const languages = ref([
        { lang: 'Polski', level: 'Ojczysty' },
        { lang: 'Angielski', level: 'Zaawansowany' },
        { lang: 'Niemiecki', level: 'Komunikatywny' }
    ]);

    const isModalVisible = ref(false);
    const modalType = ref(0);
    const unsaved = ref(false);
    const isEditMode = ref(false);

    // functions

    function inputChanged() {
        if(newUserData.value.firstName != userData.value.imie || 
        newUserData.value.lastName != userData.value.nazwisko || 
        newUserData.value.position != userData.value.stanowisko ||
        newUserData.value.country != userData.value.kraj ||
        newUserData.value.age != userData.value.wiek ||
        newUserData.value.phoneNumber != userData.value.numer_telefonu) {
            unsaved.value = true;
        } else {
            unsaved.value = false;
        }
    }

    async function saveChanges() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/user/UpdateBasicData.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'data': newUserData.value } });

        if(response) {
            if(response === true) {
                unsaved.value = false;
            } else {
                unsaved.value = true;
            }
        }
    }

    function formatPhoneNumber() {
        let cleaned = ('' + newUserData.value.phoneNumber).replace(/\D/g, '');
        let match = cleaned.match(/^(\d{0,3})(\d{0,3})(\d{0,3})$/);

        if (match) {
            newUserData.value.phoneNumber = [match[1], match[2], match[3]].filter(Boolean).join('-');
        }   
    }
</script>

<style scoped>
    #unsaved {
        position: absolute;
        left: calc(50% - 200px);
        padding: 20px;
        top: 20px;
        width: 400px;
        background-color: var(--asc-bg-alt);
        box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.15);
        display: flex; 
        flex-direction: column;
        gap: 20px;
        border-radius: 2px;
        z-index: 9999;
        align-items: center;
    }

    #unsaved svg {
        fill: #ffcc00;
        width: 50px;
    }

    #unsaved h2 {
        font-size: 18px;
    }

    #main-flex {
        display: flex;
        flex-direction: column;
        flex: 1;
        border-right: 1px solid #DDD;
    }

    .user-input {
        border-bottom: 1px solid #DDD;
        padding: 5px;
        font-size: 18px;
    }

    .user-input-mini {
        border-bottom: 1px solid #DDD;
        padding: 5px 0px;
        font-size: 16px;
    }

    .required {
        position: relative;
    }

    .required::after{
        content: '*';
        position: absolute;
        right: 5px;
        top: 0;
        font-size: 15px;
        color: #ff3333;
    }

    .user-input:focus, .user-input-mini:focus {
        border-color: var(--asc-bg-border-alt);
    }

    h3#user-position .user-input {
        margin: 20px 0;
    }

    main #user-top {
        background-color: #FFF;
        width: 100%;
        height: 270px;
        display: flex;
        align-items: center;
        border-bottom: 1px solid #DDD;
        position: relative;
    }

    #user-main {
        display: flex;
        flex: 1;
        border-right: 1px solid #DDD;
    }

    #user-alt {
        width: 350px;
        height: 150px;
        padding: 13px 40px 0 20px;
        gap: 10px;
        display: flex;
        flex-direction: column;
    }

    #user-alt > div {
        display: flex;
        justify-content: space-between;
        gap: 40px;
    }

    #user-alt > div h4 {
        color: var(--asc-txt-ui-sec);
        font-weight: 600;
        font-size: 15px;
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
        position: relative;
    }

    #img #upload-image {
        position: absolute;
        left: 0;
        top: 0;
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

    #img img {
        width: 100%;
        height: 100%;
        border-radius: 50%;
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
        display: flex;
        gap: 10px;
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

    #languages {
        width: 100%;
    }

    #languages > div {
        display: flex;
        justify-content: space-between;
        padding: 10px 13px
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

    @media (max-width: 1686px) {
        #user-top {
            flex-direction: column;
            gap: 60px;
            padding-top: 40px;
            height: auto !important;
        }

        #user-main {
            width: 100%;
        }

        #user-alt {
            border-top: 1px solid var(--asc-bg-border);
            width: calc(100% - 60px);
        }
    }

    @media (max-width: 1300px) {
        section#right-side h4 {
            font-size: 14px;
        }

        #main-flex {
            flex: 1;
        }
    }

    @media (max-width: 1075px) {
        section#right-side h4 {
            font-size: 12px;
        }
    }

    @media (max-width: 1015px) {
        section#right-side {
            border-top: 1px solid var(--asc-bg-border);
            border-right: 1px solid var(--asc-bg-border);
            width: 100%;
        }
    }

    @media (max-width: 775px) {
        #user-basic-info {
            padding-right: 10px;
            width: 60%;
        }

        h2#user-name {
            gap: 20px;
        }

        h2#user-name > span {
            width: 50%;
        }

        h2#user-name > span input {
            width: calc(100% - 10px);
        }
    }

    @media (max-width: 600px) {
        #user-main {
            flex-direction: column;
            align-items: center;
        }

        #user-top {     
            gap: 20px; 
        }

        #user-basic-info {
            padding: 20px;
            width: calc(100% - 40px);
        }

        #share {
            width: 100%;
            margin-top: 10px;
        }

        h3#user-position span {
            width: 100%;
        }

        h3#user-position span input {
            width: calc(100% - 10px);
        }
    }
</style>