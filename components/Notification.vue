<template>
    <div class="notification">
        <h1>{{ notification.title }}</h1>
        <h2>{{ notification.description }}</h2>

        <p class="date">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                <path d="M464 256A208 208 0 1 1 48 256a208 208 0 1 1 416 0zM0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM232 120V256c0 8 4 15.5 10.7 20l96 64c11 7.4 25.9 4.4 33.3-6.7s4.4-25.9-6.7-33.3L280 243.2V120c0-13.3-10.7-24-24-24s-24 10.7-24 24z"/>
            </svg>

            {{ notification.notification_date }}
        </p>
    </div>
</template>

<script setup>
    defineProps(['notification']);
</script>

<style scoped>
    .notification {
        background-color: var(--asc-bg-alt);
        box-shadow: rgba(87, 32, 58, 0.08) 0px 20px 1.2rem;
        padding: 10px;
        border-left: 10px solid var(--asc-bg-border-alt);
        position: relative;
    }

    .notification:hover {
        cursor: pointer;
        background-color: #eee;
    }

    h1 {
        font-size: 25px;
        padding-bottom: 10px;
        color: var(--asc-txt-sec);
    }

    h2 {
        font-size: 20px;
        color: var(--asc-txt-ui-sec);
    }

    .date {
        position: absolute;
        top: 10px;
        right: 10px;
        display: flex;
        align-items: center;
        gap: 10px;
        color: #aaa;
    }

    .date svg {
        fill: #aaa;
        width: 18px;
    }
</style>