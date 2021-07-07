import { TestBed } from '@angular/core/testing';

import { KpiKindService } from './kpi-kind.service';

describe('KpiKindService', () => {
  let service: KpiKindService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(KpiKindService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
