//
//  AnnictListEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/04.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

public class AnnictPageEntity {
    public var next_page: Int?
    public var prev_page: Int?
    public var total_count: Int

    init(
        next_page: Int?,
        prev_page: Int?,
        total_count: Int
        ) {
        self.next_page = next_page
        self.prev_page = prev_page
        self.total_count = total_count
    }
}

public class AnnictWorkListEntity: AnnictPageEntity {
    public var works: [AnnictWorkEntity]

    required public init(works: [AnnictWorkEntity],
         next_page: Int?,
         prev_page: Int?,
         total_count: Int) {

        self.works = works
        super.init(next_page: next_page,
                   prev_page: prev_page,
                   total_count: total_count)
    }
}

extension AnnictWorkListEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            works: e <|| "works",
            next_page: e <|? "next_page",
            prev_page: e <|? "prev_page",
            total_count: e <| "total_count")
    }
}

public class AnnictEpisodeListEntity: AnnictPageEntity {
    public var episodes: [AnnictEpisodeEntity]

    required public init(episodes: [AnnictEpisodeEntity],
         next_page: Int?,
         prev_page: Int?,
         total_count: Int) {

        self.episodes = episodes
        super.init(next_page: next_page,
                   prev_page: prev_page,
                   total_count: total_count)
    }
}

extension AnnictEpisodeListEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            episodes: e <|| "episodes",
            next_page: e <|? "next_page",
            prev_page: e <|? "prev_page",
            total_count: e <| "total_count"
        )
    }
}

public class AnnictRecordListEntity: AnnictPageEntity {
    public var records: [AnnictRecordEntity]

    required public init(records: [AnnictRecordEntity],
         next_page: Int?,
         prev_page: Int?,
         total_count: Int) {

        self.records = records
        super.init(next_page: next_page,
                   prev_page: prev_page,
                   total_count: total_count)
    }
}

extension AnnictRecordListEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            records: e <|| "records",
            next_page: e <|? "next_page",
            prev_page: e <|? "prev_page",
            total_count: e <| "total_count"
        )
    }
}



public class AnnictProgramListEntity: AnnictPageEntity {
    public var programs: [AnnictProgramEntity]

    required public init(programs: [AnnictProgramEntity],
         next_page: Int?,
         prev_page: Int?,
         total_count: Int) {

        self.programs = programs
        super.init(next_page: next_page,
                   prev_page: prev_page,
                   total_count: total_count)
    }
}

extension AnnictProgramListEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            programs: e <|| "programs",
            next_page: e <|? "next_page",
            prev_page: e <|? "prev_page",
            total_count: e <| "total_count"
        )
    }
}
