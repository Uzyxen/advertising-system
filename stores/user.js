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
            const headers = useRequestHeaders(['cookie']);
            const { data: response } = await useFetch('http://localhost/advertising-system/api/user/LogIn.php', { headers, credentials: 'include', method: 'POST', body: user_data, responseType: 'json' });
         
            if(response.value.data) {
                this.logged = response.value.data.logged;
                this.first_name = response.value.data.first_name;
                this.last_name = response.value.data.last_name;
                this.description = response.value.data.description;
                this.phone_number = response.value.data.phone_number;
                this.email = response.value.data.email;
                this.position = response.value.data.position;
                this.gender = response.value.data.gender;
                this.age = response.value.data.age;
                this.country = response.value.data.country;

                return true;
            } else if(response.value) {
                console.log(response.value);

                return false;
            }
        },

        async GetUserData() {
            const headers = useRequestHeaders(['cookie']);
            const { data: response } = await useFetch('http://localhost/advertising-system/api/user/GetUserData.php', { headers, credentials: 'include', responseType: 'json' });

            if(response.value.data) {
                this.logged = response.value.data.logged;
                this.first_name = response.value.data.first_name;
                this.last_name = response.value.data.last_name;
                this.description = response.value.data.description;
                this.phone_number = response.value.data.phone_number;
                this.email = response.value.data.email;
                this.position = response.value.data.position;
                this.gender = response.value.data.gender;
                this.age = response.value.age;
                this.country = response.value.data.country;
            } else if(response.value) {
                console.log(response.value);
            }
        },

        async LogOut() {
            const headers = useRequestHeaders(['cookie']);
            await useFetch('http://localhost/advertising-system/api/user/LogOut.php', { headers, credentials: 'include' });

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