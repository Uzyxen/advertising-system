<template>
    <div class="offer" @click="GoToOfferPage(offer.ogloszenie_id)">
        <svg v-if="editMode === false" class="star" xmlns="http://www.w3.org/2000/svg" height="16" width="18" viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc. --><path d="M287.9 0c9.2 0 17.6 5.2 21.6 13.5l68.6 141.3 153.2 22.6c9 1.3 16.5 7.6 19.3 16.3s.5 18.1-5.9 24.5L433.6 328.4l26.2 155.6c1.5 9-2.2 18.1-9.7 23.5s-17.3 6-25.3 1.7l-137-73.2L151 509.1c-8.1 4.3-17.9 3.7-25.3-1.7s-11.2-14.5-9.7-23.5l26.2-155.6L31.1 218.2c-6.5-6.4-8.7-15.9-5.9-24.5s10.3-14.9 19.3-16.3l153.2-22.6L266.3 13.5C270.4 5.2 278.7 0 287.9 0zm0 79L235.4 187.2c-3.5 7.1-10.2 12.1-18.1 13.3L99 217.9 184.9 303c5.5 5.5 8.1 13.3 6.8 21L171.4 443.7l105.2-56.2c7.1-3.8 15.6-3.8 22.6 0l105.2 56.2L384.2 324.1c-1.3-7.7 1.2-15.5 6.8-21l85.9-85.1L358.6 200.5c-7.8-1.2-14.6-6.1-18.1-13.3L287.9 79z"/></svg>

        <div class="offer-content">
            <div class="image">
                <img src="/company/gizlomar.png" alt="logo firmy">
            </div>

            <div>
                <h3>{{ offer.tytul }}</h3>
                <p class="company">
                    <svg xmlns="http://www.w3.org/2000/svg" height="15" width="11" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc. --><path d="M64 48c-8.8 0-16 7.2-16 16V448c0 8.8 7.2 16 16 16h80V400c0-26.5 21.5-48 48-48s48 21.5 48 48v64h80c8.8 0 16-7.2 16-16V64c0-8.8-7.2-16-16-16H64zM0 64C0 28.7 28.7 0 64 0H320c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V64zm88 40c0-8.8 7.2-16 16-16h48c8.8 0 16 7.2 16 16v48c0 8.8-7.2 16-16 16H104c-8.8 0-16-7.2-16-16V104zM232 88h48c8.8 0 16 7.2 16 16v48c0 8.8-7.2 16-16 16H232c-8.8 0-16-7.2-16-16V104c0-8.8 7.2-16 16-16zM88 232c0-8.8 7.2-16 16-16h48c8.8 0 16 7.2 16 16v48c0 8.8-7.2 16-16 16H104c-8.8 0-16-7.2-16-16V232zm144-16h48c8.8 0 16 7.2 16 16v48c0 8.8-7.2 16-16 16H232c-8.8 0-16-7.2-16-16V232c0-8.8 7.2-16 16-16z"/></svg>
                    {{ offer.firma }}
                </p>
                <p class="location">
                    <svg xmlns="http://www.w3.org/2000/svg" height="15" width="11" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc. --><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                    {{ offer.lokalizacja }}
                </p>
                <p class="pay_contract">
                    {{ offer.wynagrodzenie_min.toLocaleString() }} zł - {{ offer.wynagrodzenie_max.toLocaleString() }} zł / {{ offer.czestotliwosc_wynagrodzenia }}
                </p>
            </div>
        </div>

        <div class="offer-bottom">
            <p>
                Opublikowano: {{ offer.data_dodania }}
            </p>
        </div>
    </div>
</template>

<script setup>
    const props = defineProps(['offer', 'editMode']);
    const emit = defineEmits(['offerClicked']);

    async function GoToOfferPage(id) {
        if(props.editMode === false) {
            await navigateTo(`/oferty/${id}`);
        } else {
            emit('offerClicked');
        }
    }
</script>

<style scoped>
    .offer{
        cursor: pointer;
        box-shadow: 0 0 5px rgba(0,0,0,.12);
        border-radius: 2px;
        position: relative;
        background-color: var(--asc-bg-alt);
    }

    .offer:hover {
        background-color: #f7f7f7;
    }

    .offer p{
        display: flex;
        gap: 7px;
        align-items: center;
    }

    .offer .image{
        width: 95px;
        height: 95px;
        margin-right: 30px;
    }

    .offer .image img{
        width: 100%;
        height: auto;
    }

    
    .offer svg.star{
        position: absolute;
        right: 10px;
        top: 10px;
        fill: #ccc;
        width: 30px;
        height: 30px;
    }

    .offer .offer-content{
        padding: 15px 20px;
        display: flex;
    }

    .offer-content #image{
        width: 122px;
        margin-right: 20px;
    }

    .offer .offer-bottom{
        border-top: 1px solid #DDD;
    }

    .offer .offer-bottom p{
        font-size: 12px;
        padding: 10px 20px;
        color: #848191;
    }

    .offer h3{
        color: #6244DB;
    }

    .offer p{
        margin: 0;
    }

    p.company{
        font-weight: 600;
        margin-top: 10px;
    }

    p.location{
        margin-top: 10px;
        font-size: 15px;
    }

    p.pay_contract{
        margin-top: 20px;
        opacity: 0.7;
    }

</style>