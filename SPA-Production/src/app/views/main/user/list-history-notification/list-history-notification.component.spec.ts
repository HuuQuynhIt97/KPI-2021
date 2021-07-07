import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { ListHistoryNotificationComponent } from './list-history-notification.component';

describe('ListHistoryNotificationComponent', () => {
  let component: ListHistoryNotificationComponent;
  let fixture: ComponentFixture<ListHistoryNotificationComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ ListHistoryNotificationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ListHistoryNotificationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
