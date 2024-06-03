<template>
    <div id="container">
        <SectionTitle>Ustawienia</SectionTitle>

        <div id="content">
            <nav>
                <ul>
                    <li>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                            <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                            <path d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/>
                        </svg>

                        Bezpieczeństwo
                    </li>
                    <li>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                            <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                            <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM169.8 165.3c7.9-22.3 29.1-37.3 52.8-37.3h58.3c34.9 0 63.1 28.3 63.1 63.1c0 22.6-12.1 43.5-31.7 54.8L280 264.4c-.2 13-10.9 23.6-24 23.6c-13.3 0-24-10.7-24-24V250.5c0-8.6 4.6-16.5 12.1-20.8l44.3-25.4c4.7-2.7 7.6-7.7 7.6-13.1c0-8.4-6.8-15.1-15.1-15.1H222.6c-3.4 0-6.4 2.1-7.5 5.3l-.4 1.2c-4.4 12.5-18.2 19-30.6 14.6s-19-18.2-14.6-30.6l.4-1.2zM224 352a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z"/>
                        </svg>
                        Pomoc
                    </li>

                    <li>
                        Preferencje

                        <ul class="submenu">
                            <li>
                                powiadomienia
                            </li>

                            <li>
                                Tryb ciemny
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>

            <div id="main-content">
                <section>
                    <h2>Aktywne sesje</h2>

                    <ul>
                        <li class="session" v-for="session in activeSessions">
                            {{ session.id }}

                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                                <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                <path d="M310.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-192 192c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L242.7 256 73.4 86.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l192 192z"/>
                            </svg>
                        </li>
                    </ul>
                </section>
            </div>
        </div>
    </div>
</template>

<script setup>
    const activeSessions = ref([
        { id: '12b3123b213g12iug312ui3' },
        { id: 'ok12ij4v12k34fg12ui34f1' }
    ]);
</script>

<style scoped>
    #container {
        padding: 20px 150px;
    }

    nav {
        width: 200px;
        height: 100%;
        border-right: 1px solid #DDD;
    }

    #content {
        background-color: var(--asc-bg-alt);
        box-shadow: rgba(87, 32, 58, 0.08) 0px 0px 1.2rem;
        height: 600px;
        display: flex;
    }

    nav > ul {
        margin: 0;
        padding: 0;
        list-style-type: none;
    }

    nav > ul li {
        padding: 15px 20px;
        display: flex;
        gap: 10px;
        cursor: pointer;
        color: var(--asc-txt-sec);
        position: relative;
    }

    nav > ul li:hover {
        background-color: #eee;
    }

    nav > ul li svg {
        width: 15px;
        fill: var(--asc-txt-sec);
    }

    ul.submenu {
        margin: 0;
        padding: 0;
        position: absolute;
        left: 20px;
        top: 40px;
    }

    ul.submenu li {
        font-size: 15px;
        position: relative;
    }

    ul.submenu li::before {
        content: '';
        position: absolute;
        left: 0;
        top: 0;
        background-color: #eee;
        height: 100%;
        width: 2px;
    }

    ul.submenu li:last-of-type::before {
        content: '';
        position: absolute;
        left: 0;
        top: 0;
        background-color: #eee;
        height: 50%;
        width: 2px;
    }

    ul.submenu li::after {
        content: '';
        position: absolute;
        left: 0;
        top: 50%;
        background-color: #ddd;
        height: 2px;
        width: 15px;
    }

    section h2 {
        padding: 20px;
    }

    section ul {
        list-style-type: none;
        margin: 0;
        padding: 0 20px;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    section .session {
        padding: 20px 0;
        padding-left: 10px;
        border: 1px solid #DDD;
        width: 400px;
        position: relative;
        display: flex;
        justify-content: space-between;
        cursor: pointer;
    }

    section .session:hover {
        background-color: #eee;
    }

    section .session svg {
        width: 10px;
        margin-right: 10px;
    }
</style>