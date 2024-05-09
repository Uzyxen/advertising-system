<template>
    <div id="root">
        <div id="background-baner"></div>
        <div id="root-inner">
            <nav id="top-nav">
                <ul>
                    <li class="current">Profil</li>
                    <li>CV</li>
                </ul>
            </nav>

            <main>
                <section id="left-side">
                    <div id="user-main">
                        <div id="image">
                            <div id="img"></div>
                        </div>
                        <h2 id="user-name"></h2>
                        <h3 id="user-position"></h3>
                    </div>
                </section>

                <section id="main-section">
                    <div>
                        <h2 class="header">Podsumowanie zawodowe</h2>
                        <hr>
                        <p></p>
                    </div>

                    <div>
                        <h2 class="header">Umiejętności</h2>
                        <hr>

                        <div id="skills">

                        </div>
                    </div>

                    <div>
                        <h2 class="header">Doświadczenie</h2>
                        <hr>

                        <div id="experience">
                            <div id="experience-block">
                                <div id="abstract">
                                    <div id="circle"></div>
                                    <div id="line"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="right-side">
                    
                </section>
            </main>
        </div>
    </div>
</template>

<script setup>
    definePageMeta({
        middleware: 'auth-user'
    });

    const { data: userData } = await useFetch('http://localhost/advertising-system/backend/api/user/GetUserData.php', { credentials: 'include', responseType: 'json', method: 'post' });
</script>

<style scoped>
    
</style>