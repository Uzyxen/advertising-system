<template>
    <div id="container">
        <SectionTitle>Ogłoszenia firm</SectionTitle>

        <div id="offers">
            <div id="add-new">
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                        <path d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/>
                    </svg>

                    <h3>Dodaj nową oferte</h3>
                </div>
            </div>

            
        </div>
    </div>
</template>

<script setup>

</script>

<style scoped>
    #container {
        padding: 20px 150px 0;
        height: 100vh;
        display: flex;
        flex-direction: column;
    }

    #offers {
        box-shadow: 0 0 5px rgba(0,0,0,.12);
        background-color: var(--asc-bg-alt);
        height: 500px;
        padding: 5px;
    }

    #add-new {
        border: 1px solid var(--asc-bg-border);
        display: flex;
        justify-content: center;
        cursor: pointer;
    }

    #add-new:hover {
        background-color: #eee;
    }

    #add-new > div {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
    }

    #add-new svg {
        width: 80px;
        fill: var(--asc-txt-ui-sec);
    }

    #add-new h3 {
        color: var(--asc-txt-sec);
    }
</style>