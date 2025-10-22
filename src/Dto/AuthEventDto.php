<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\AuthEvents\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Žádná logika; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class AuthEventDto {
    public function __construct(
        public readonly ?int $id,
        public readonly ?int $userId,
        public readonly string $type,
        public readonly ?string $ipHash,
        public readonly ?string $ipHashKeyVersion,
        public readonly ?string $userAgent,
        public readonly \DateTimeImmutable $occurredAt,
        public readonly array|null $meta,
        public readonly ?string $metaEmail
    ) {}

    /** Vhodné pro serializaci/logování (bez binárních/velkých blobů). */
    public function toArray(): array {
        // get_object_vars funguje dobře s public readonly vlastnostmi
        return get_object_vars($this);
    }
}
