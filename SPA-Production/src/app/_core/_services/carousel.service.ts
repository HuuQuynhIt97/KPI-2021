import { environment } from './../../../environments/environment';
import { HttpClient ,HttpHeaders } from '@angular/common/http';
import { Carousel } from './../_model/carousel';
import { Injectable } from '@angular/core';
import { map } from 'rxjs/operators';
import { Observable, of, throwError } from 'rxjs';
const httpOptions = {
  headers: new HttpHeaders(
    {
      'Content-Type': 'application/json',
    }
  )
}
@Injectable({
  providedIn: 'root'
})
export class CarouselService {
  constructor(
    private http: HttpClient
  ) { }

  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error);
      return of(result as T);
    }
  }

  getAll(url: string): Observable<Carousel[]>{
    return this.http.get<Carousel[]>(url,httpOptions)
  }

  delete(url: string){
    return this.http.delete(url,httpOptions)
  }
}
