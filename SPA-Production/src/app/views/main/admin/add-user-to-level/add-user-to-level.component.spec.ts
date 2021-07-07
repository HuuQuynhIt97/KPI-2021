import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { AddUserToLevelComponent } from './add-user-to-level.component';

describe('AddUserToLevelComponent', () => {
  let component: AddUserToLevelComponent;
  let fixture: ComponentFixture<AddUserToLevelComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ AddUserToLevelComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AddUserToLevelComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
