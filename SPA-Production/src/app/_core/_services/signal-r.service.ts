import { environment } from './../../../environments/environment';
import { Injectable } from '@angular/core';
import * as signalR from '@aspnet/signalr';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import {Router, ActivatedRoute } from '@angular/router';
@Injectable({
  providedIn: 'root'
})
export class SignalRService {
  baseUrl: any = environment.apiUrl
  private hubConnection: signalR.HubConnection
  public startConnection = () => {
    this.hubConnection = new signalR.HubConnectionBuilder()
      .withUrl(this.baseUrl + 'henry-hub')
      .build();
    this.hubConnection.start().then(() => console.log('Connection started')).catch(err =>{
      })
  }
  public Notification = () => {
    this.hubConnection.on('ReceiveMessage', (user, message) => {
    });
  }

  public IsOnline = () => {
    this.hubConnection.on('updateCount', (data) => {
    });
  }
  constructor(
    private router: Router,
    private route: ActivatedRoute,
  ) { }
}
