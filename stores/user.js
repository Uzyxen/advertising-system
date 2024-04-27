export const useUserStore = defineStore('userStore', {
    state: () => ({
        logged: false,
        first_name: '',
        last_name: '',
        description: '',
        phone_number: '',
        email: '',
        position: '',
        gender: '',
        age: 0,
        country: '',
    }),

    actions: {
        async Login(user_data) {
            const { data: response } = await $fetch('http://localhost/advertising-system/backend/api/user/LogIn.php', { credentials: 'include', method: 'POST', body: user_data, responseType: 'json' });
         
            console.log(response);

            if(response) {
                this.logged = response.logged;
                this.first_name = response.first_name;
                this.last_name = response.last_name;
                this.description = response.description;
                this.phone_number = response.phone_number;
                this.email = response.email;
                this.position = response.position;
                this.gender = response.gender;
                this.age = response.age;
                this.country = response.country;

                return true;
            } else {
                return false;
            }
        },

        async GetUserData() {
            const { data: response } = await $fetch('http://localhost/advertising-system/backend/api/user/GetUserData.php', { credentials: 'include', responseType: 'json' });

            if(response) {
                this.logged = response.logged;
                this.first_name = response.first_name;
                this.last_name = response.last_name;
                this.description = response.description;
                this.phone_number = response.phone_number;
                this.email = response.email;
                this.position = response.position;
                this.gender = response.gender;
                this.age = response.age;
                this.country = response.country;
            }
        },

        async LogOut() {
            await $fetch('http://localhost/advertising-system/api/user/LogOut.php', { credentials: 'include' });

            this.logged = false;
            this.first_name = '';
            this.last_name = '';
            this.description = '';
            this.phone_number = '';
            this.email = '';
            this.position = '';
            this.gender = '';
            this.age = '';
            this.country = '';
        }
    }
});