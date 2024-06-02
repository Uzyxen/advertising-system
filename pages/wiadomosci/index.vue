<template>
    <div id="root">
        <SectionTitle>Wiadomości</SectionTitle>
        <div id="root-inner">
            <div id="chat">
                <div id="contacts">
                    <div id="topbar">
                        <h2>moltaro.pl</h2>
                    </div>

                    <div class="contact" v-for="contact in contacts" @click="selectContact(contact)">
                        {{ contact }}
                    </div>
                </div>

                <div id="right">
                    <div id="topbar">
                        <h2>{{ selectedContact }}</h2>
                    </div>

                    <div id="messages">
                        <div class="message" v-for="message in messages">
                            {{ message }}
                        </div>
                    </div>

                    <div id="message-content">
                        <textarea name="message" id="message" v-model="newMessage"></textarea>
                        <button @click="sendMessage">Wyślij</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    // data
    const newMessage = ref('');
    const contacts = ref([
        'Kontakt 1', 
        'Kontakt 2',
        'Kontakt 3'
    ]);
    const messages = ref([]);

    const selectedContact = ref();

    // functions
    function sendMessage() {
        messages.value.push(newMessage.value);
        newMessage.value = '';
    }

    function selectContact(contact) {
        selectedContact.value = contact;
    }
</script>

<style scoped>
    #root {
        width: calc(100% - 300px);
        height: 700px;
        margin: 20px 150px;
        padding-bottom: 500px
    }

    #root-inner {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
    }

    #chat {
        background-color: #fff;
        width: 100%;
        height: 100%;
        box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.15);
        display: flex;
    }

    #contacts {
        width: 25%;
        border-right: 1px solid #DDD;
        display: flex;
        flex-direction: column;
    }

    #contacts #topbar {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #contacts #topbar h2 {
        color: #6244DB;
        font-size: 35px;
    }

    #contacts .contact {
        display: flex;
        height: 80px;
        align-items: center;
        padding: 0 0 0 40px;
        border-bottom: 1px solid #DDD;
        cursor: pointer;
    }

    #contacts .contact:hover {
        background-color: #eee;
    }

    #right {
        width: 75%;
    }

    #contacts #topbar, #right #topbar {
        width: 100%;
        border-bottom: 1px solid #DDD;
        height: 80px;
    }

    #right #topbar{
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #right #messages {
        width: calc(100% - 80px);
        height: calc(100% - 202px);
        display: flex;
        flex-direction: column;
        position: relative;
        padding: 10px 40px;
        gap: 10px;
        overflow-y: auto;
    }

    .message {
        background-color: #eee;
        padding: 10px;
        max-width: 60%;
    }

    .message:not(.my-message) {
        align-self: flex-start;
    }

    .message.my-message {
        background-color: #6244DB;
        color: #fff;
        align-self: flex-end;
    }

    #message-content {
        height: 100px;
        display: flex;
    }

    #message-content textarea {
        width: 95%;
        height: 100%;
        border: none;
        outline: none;
        border-top: 1px solid #DDD;
        border-bottom: 1px solid #DDD;
        resize: none;
        padding: 0;
        font-size: 15px;
    }

    #message-content button{
        width: 5%;
        height: 100%;
        border:  1px solid #6244DB;
        background-color: #6244DB;
        color: #FFF;
        cursor: pointer;
        padding: 2px 0;
    }
</style>