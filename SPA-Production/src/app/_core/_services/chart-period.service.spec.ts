import { TestBed } from '@angular/core/testing';

import { ChartPeriodService } from './chart-period.service';

describe('ChartPeriodService', () => {
  let service: ChartPeriodService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ChartPeriodService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
