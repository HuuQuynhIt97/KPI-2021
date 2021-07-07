import { TestBed } from '@angular/core/testing';

import { KpiTrendViewService } from './kpi-trend-view.service';

describe('KpiTrendViewService', () => {
  let service: KpiTrendViewService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(KpiTrendViewService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
