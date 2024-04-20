export function IsUserLogged() {
    const userStore = useUserStore();

    if(userStore.logged === true) 
        return true;
    return false;
}

export function IsCompanyLogged() {
    const companyStore = useCompanyStore();

    if(companyStore.logged === true)
        return true;
    return false;
}