export interface User {
    id: number;
    account: string;
    email: string;
    username: string;
    password: string;
    fullname: string;
    created_by: string;
    created_time: Date;
    updated_by: string;
    updated_time: Date;
    active: boolean;
}
