import { TestBed } from '@angular/core/testing';

import { ListHistoryNotificationService } from './list-history-notification.service';

describe('ListHistoryNotificationService', () => {
  let service: ListHistoryNotificationService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ListHistoryNotificationService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
