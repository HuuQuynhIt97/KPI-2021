import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { KpiKindComponent } from './kpi-kind.component';

describe('KpiKindComponent', () => {
  let component: KpiKindComponent;
  let fixture: ComponentFixture<KpiKindComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ KpiKindComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(KpiKindComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
