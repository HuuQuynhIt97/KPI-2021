import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { OcUserComponent } from './oc-user.component';

describe('OcUserComponent', () => {
  let component: OcUserComponent;
  let fixture: ComponentFixture<OcUserComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ OcUserComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OcUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
