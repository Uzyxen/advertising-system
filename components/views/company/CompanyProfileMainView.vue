<template>
    <ModalBlock @close="isModalVisible = false" :isVisible="isModalVisible">
        <EditImage v-if="modalType === 0" />
        <EditDescription v-if="modalType === 1" :is-company="true" :description="companyData.description" @saved="(value) => { companyData.description = value; isModalVisible = false}">
            Opis firmy
        </EditDescription>
        <EditTechnologies v-if="modalType === 2" :technologies="technologies" @added="(value) => { technologies.push({ technology: value }) }" />
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
                    </div>
                </div>

                <div id="user-basic-info">
                    <div>
                        <h2 id="user-name">
                            <span class="required">
                                <input spellcheck="false" type="text" placeholder="Nazwa firmy: " @input="inputChanged" class="user-input" v-model="newCompanyData.name">
                            </span>
                        </h2>

                        <h3>
                            <div id="offer-counter">
                                {{ companyData.quantity }} oferty pracy
                            </div>

                            <div id="remote-work">
                                Możliwość pracy zdalnej
                            </div>
                        </h3>
                    </div>
                </div>
            </div>

            <div id="user-alt">
                <div>
                    <h4>Kraj: </h4>
                    <input type="text" placeholder="Kraj: " class="user-input-mini" @input="inputChanged" v-model="newCompanyData.country">
                </div>

                <div>
                    <h4>NIP: </h4>
                    <span class="required">
                        <input maxlength="13" type="text" placeholder="NIP: " class="user-input-mini"  @input="inputChanged(); formatPhoneNumber()" v-model="newCompanyData.nip">
                    </span>
                </div>
            </div>
        </section>

        <section id="main-section">
            <div>
                <EditHeader :is-edit-mode="true" @edit="isModalVisible = true; modalType = 1">Opis firmy</EditHeader>
                <hr>
                <p>{{ companyData.description }}</p>
            </div>

            <div>
                <EditHeader :is-edit-mode="true" @edit="isModalVisible = true; modalType = 2">Technologie</EditHeader>
                <hr>

                <div id="skills">
                    <UserSkill v-for="technology in technologies" :skill="technology.technology" />
                </div>
            </div>

            <div>
                <EditHeader :is-edit-mode="false">Oferty firmy</EditHeader>
                <hr>
                
                <div id="offers-flex">
                    <OffersList @offer-clicked="offerClicked" :offers="offers" :edit-mode="false" />
                </div>
            </div>
        </section>
    </div>
</template>

<script setup>
    const { data: companyData } = await useFetch('http://localhost/advertising-system/backend/api/company/GetCompanyData.php', { credentials: 'include', responseType: 'json', method: 'post' });
    const { data: technologies } = await useFetch('http://localhost/advertising-system/backend/api/company/GetCompanyTechnologies.php', { credentials: 'include', responseType: 'json', method: 'post' });
    const { data: offers } = await useFetch('http://localhost/advertising-system/backend/api/offer/GetCompanyOffers.php', { credentials: 'include', responseType: 'json', method: 'post' });
    

    // --------
    // data

    const newCompanyData = ref({
        name: companyData.value.nazwa_firmy,
        country: companyData.value.country,
        nip: companyData.value.NIP
    });

    const isModalVisible = ref(false);
    const modalType = ref(0);
    const unsaved = ref(false);

    // functions

    function inputChanged() {
        if(newCompanyData.value.name != companyData.value.nazwa_firmy || 
        newCompanyData.value.country != companyData.value.country || 
        newCompanyData.value.nip != companyData.value.NIP) {
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
        let cleaned = ('' + newCompanyData.value.nip).replace(/\D/g, '');
        let match = cleaned.match(/^(\d{0,3})(\d{0,3})(\d{0,2})(\d{0,2})$/);

        if (match) {
            newCompanyData.value.nip = [match[1], match[2], match[3], match[4], match[5]].filter(Boolean).join('-');
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

    h3 {
        font-size: 14px;
        white-space: nowrap;
        display: flex;
        gap: 10px;
    }

    #offer-counter {
        background-color: #ddd;
        padding: 10px;
        width: fit-content;
        border-radius: 2px;
    }

    #remote-work {
        background-color: #ddd;
        padding: 10px;
        width: fit-content;
        border-radius: 2px;
    }

    #offers-flex {
        padding: 10px;
        width: calc(100% - 20px);
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    #main-flex {
        display: flex;
        flex-direction: column;
        width: calc(100% - 300px);
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

    #user-basic-info div {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        gap: 15px;
    }

    #user-main #image #img {
        background-image: url('/src/assets/example-pp.jpg');
        width: 150px;
        height: 150px;
        background-size: cover;
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