﻿using NbaManagement.Database;
using System.Collections.Generic;
using System.Linq;

namespace NbaManagement.Services
{
    public class SeasonService
    {
        private readonly DatabaseContext _dbContext;

        public SeasonService(DatabaseContext dbContext) => _dbContext = dbContext;

        public IEnumerable<Season> GetSeasons() => _dbContext.Seasons.Local.OrderByDescending(season => season.Name);

        public Season GetCurrentSeason() => GetSeasons().FirstOrDefault();
    }
}