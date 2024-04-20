<template>
    <section>
        <div id="main-left">
            <OfferCounter />
            <div id="main-text">
                <h2>Sprawdzonych ofert pracy</h2>
                <h3>od najlepszych pracodawców</h3>
            </div>

            <div id="button-box">
                <button id="search-for-offers"><a href="#search-for-offers-section">Szukaj ofert</a></button>
                <button id="find-out-more"><a href="">Dowiedz się więcej</a></button>
            </div>
        </div>

        <div id="main-right">
            <div id="blur-circle"></div>

            <img src="/img/home-abstract-1.svg" alt="Home abstract 1" id="abstract-1">
            <img src="/img/home-abstract-2.svg" alt="Home abstract 2" id="abstract-2">
            <img src="/img/home-abstract-3.svg" alt="Home abstract 3" id="abstract-3">
            <img src="/img/home-abstract-4.svg" alt="Home abstract 4" id="abstract-4">
            <img src="/img/home-abstract-5.svg" alt="Home abstract 5" id="abstract-5">
            <img src="/img/home-photo-1.png" alt="Home photo 1" id="photo-1">
            <img src="/img/home-photo-2.png" alt="Home photo 2" id="photo-2">
            <img src="/img/home-photo-3.png" alt="Home photo 3" id="photo-3">
        </div>
    </section>
</template>

<script setup>

</script>

<style scoped>
    section{
        margin-top: 220px;
        padding: 0 150px;
        display: flex;
        position: relative;
        height: calc(100vh - 60px);

    }   

    #main-left {
        z-index: 99;
    }

    #main-left, #main-right{
        width: 50%;
    }

    div#main-text{
        width: 560px;
        display: flex;
        flex-direction: column;
    }

    #main-text h3{
        align-self: flex-end;
    }

    #button-box{
        margin-top: 80px;
        display: flex;
        gap: 30px;
    }

    #button-box button{
        width: 230px;
        height: 55px;
        padding: 0;
        white-space: nowrap;
    }

    #button-box button a{
        width: 230px;
        height: 100%;
        cursor: pointer;
        font-weight: 700;
        text-decoration: none;
        color: #fff;
        display: block;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #search-for-offers{
        background-color: #6244DB;
        color: #fff;
        font-size: 22px;
        border-radius: 2px;
    }

    #find-out-more{
        background-color: transparent;
    }

    #find-out-more a{
        color: #6244DB !important;
        font-size: 22px;
        width: 100%;
        height: 100%;
    }

    h2{
        color: #393939;
        font-size: 40px;
        font-weight: 800;
        padding: 5px 0;
    }

    h3{
        color: #A3A3A3;
        font-size: 20px;
        font-weight: 800;
        text-align: right;
    }
    
    #blur-circle{
        background: rgba(98, 68, 219, 0.16);
        width: 1126px;
        height: 1125px;
        filter: blur(150px);
        position: absolute;
        top: -300px;
        right: 0;
        border-radius: 50%;
    }

    #main-right img{
        position: absolute;
    }

    img#photo-1{
        top: -100px;
        right: 600px;
    }
    
    img#photo-2{
        right: 150px;
    }

    img#photo-3{
        right: 670px;
        top: 260px;
    }

    img#abstract-1{
        right: 880px;
        top: 40px;
    }

    img#abstract-2{
        right: 190px;
        top: 350px;
    }

    img#abstract-3{
        right: 190px;
        top: -140px;
    }

    img#abstract-4{
        right: 650px;
        top: 190px;
    }

    img#abstract-5{
        right: 600px;
        top: 500px;
    }

    @media (min-width: 1920px){
        section{
            margin: 200px auto 0;
            max-width: 1440px;
        }
    }
    
    @media (max-width: 1635px) {
        img#photo-1 {
            right: 450px;
            width: 200px;
            height: 200px;
            top: -150px;
        }

        img#photo-2 {
            width: 370px;
            height: 370px;
        }

        img#photo-3 {
            right: 450px;
            width: 250px;
            height: 250px;
            top: 340px;
        }
    }

    @media (max-width: 1490px) {
        img#photo-1 {
            right: 450px;
            width: 160px;
            height: 160px;
            top: -120px;
        }

        img#photo-2 {
            width: 320px;
            height: 320px;
        }

        img#photo-3 {
            right: 450px;
            width: 200px;
            height: 200px;
            top: 250px;
        }
    }

    @media (max-width: 1300px) {
        section {
            padding: 0 60px;
        }

        img#photo-1 {
            right: 400px;
            width: 160px;
            height: 160px;
            right: 330px;
            top: -100px;
        }

        img#photo-2{
            right: 60px;
            width: 300px;
            height: 300px;
        }

        img#photo-3 {
            width: 200px;
            height: 200px;
            right: 350px;
            top: 240px;
        }
    }

    @media (max-width: 1135px) {
        section {
            padding: 0 60px;
        }

        img#photo-1, img#photo-2, img#photo-3 {
            display: none;
        }
    }

    @media (max-width: 700px) {
        section {
            padding: 0 20px;
        }

        div#main-text {
            width: 490px;
        }

        #main-left h1 {
            font-size: 55px;
        }

        #main-left h2 {
            font-size: 35px;
            white-space: nowrap;
        }

        #main-left h3 {
            font-size: 25px;
        }
    }

    
    @media (max-width: 546px) {
        section {
            margin-top: 180px;
        }

        div#main-text {
            width: 375px;
        }

        #main-left h1 {
            font-size: 47px;
        }

        #main-left h2 {
            font-size: 27px;
            white-space: nowrap;
        }

        #main-left h3 {
            font-size: 17px;
        }

        #button-box {
            gap: 25px;
        }

        #button-box button, #button-box button a {
            width: 190px;
            height: 50px;
        }

        #button-box button a {
            font-size: 18px;
        }
    }
</style>