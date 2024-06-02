<template>
    <div id="root">
        <div id="root-inner">
            <SectionTitle>Profil firmy {{ companyData.nazwa_firmy }}</SectionTitle>

            <main>
                <div id="main-flex">
                    <section id="user-top">
                        <div id="user-main">
                            <div id="image">
                                <div id="img">
                                    <div v-if="companyData.zdjecie_url">
                                        <img :src="'/company/' + companyData.zdjecie_url" alt="Logo firmy">
                                    </div>
                                </div>
                            </div>

                            <div id="user-basic-info">
                                <div>
                                    <h2 id="user-name">{{ companyData.nazwa_firmy }}</h2>

                                    <h3>
                                        <div id="offer-counter">
                                            {{ quantity.value }} oferty pracy
                                        </div>

                                        <div id="remote-work" v-if="companyData.remote">
                                            Możliwość pracy zdalnej
                                        </div>
                                    </h3>
                                </div>
                            </div>
                        </div>

                        <div id="user-alt">
                            <div>
                                <h4>Kraj: </h4>
                                <h4>{{ companyData.country }}</h4>
                            </div>

                            <div>
                                <h4>NIP: </h4>
                                <h4>{{ companyData.NIP }}</h4>
                            </div>

                            <div>
                                <h4>e-mail: </h4>
                                <h4>{{ companyData.email }}</h4>
                            </div>
                        </div>
                    </section>

                    <section id="main-section">
                        <div>
                            <EditHeader :is-edit-mode="false">Opis firmy</EditHeader>
                            <hr>
                            <p>{{ companyData.description }}</p>
                        </div>

                        <div>
                            <EditHeader :is-edit-mode="false">Technologie</EditHeader>
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
            </main>
        </div>
    </div>
</template>

<script setup>
    const route = useRoute();
    const { data: companyData } = await useFetch('http://localhost/advertising-system/backend/api/companies/GetCompany.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'id': route.params.id } });
    const { data: technologies } = await useFetch('http://localhost/advertising-system/backend/api/companies/GetCompanyTechnologies.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'id': route.params.id } });
    const { data: offers } = await useFetch('http://localhost/advertising-system/backend/api/companies/GetCompanyOffers.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'id': route.params.id } });
    const { data: quantity } = await useFetch('http://localhost/advertising-system/backend/api/companies/GetQuantity.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'id': route.params.id } });
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
        background-color: #eee;
        padding: 10px;
        width: fit-content;
        border-radius: 2px;
    }

    #remote-work {
        background-color: #eee;
        padding: 10px;
        width: fit-content;
        border-radius: 2px;
    }

    #offer-counter:hover, #remote-work:hover {
        cursor: pointer;
        background-color: #ddd;
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
        position: relative;
    }

    #img img {
        width: 100%;
        height: 100%;
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

    #root{  
        min-height: 100vh;
    }

    #root-inner {
        margin: 20px 150px 50px;
        display: flex;
        flex-direction: column;
    }

    main {
        box-shadow: rgba(87, 32, 58, 0.08) 0px 0px 1.2rem;
        display: flex;
    }

    @media (min-width: 1920px){
        #root{
            max-width: 1740px;
            margin: 0 auto;
        }
    }
</style>