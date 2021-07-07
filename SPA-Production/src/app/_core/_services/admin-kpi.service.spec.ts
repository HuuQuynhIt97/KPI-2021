import { TestBed } from '@angular/core/testing';

import { AdminKPIService } from './admin-kpi.service';

describe('AdminKPIService', () => {
  let service: AdminKPIService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AdminKPIService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
