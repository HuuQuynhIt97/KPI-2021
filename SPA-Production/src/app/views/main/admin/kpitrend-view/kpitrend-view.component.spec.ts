import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { KPITrendViewComponent } from './kpitrend-view.component';

describe('KPITrendViewComponent', () => {
  let component: KPITrendViewComponent;
  let fixture: ComponentFixture<KPITrendViewComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ KPITrendViewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(KPITrendViewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
