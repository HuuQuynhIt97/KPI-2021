import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { LateOnUploadComponent } from './late-on-upload.component';

describe('LateOnUploadComponent', () => {
  let component: LateOnUploadComponent;
  let fixture: ComponentFixture<LateOnUploadComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ LateOnUploadComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LateOnUploadComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
